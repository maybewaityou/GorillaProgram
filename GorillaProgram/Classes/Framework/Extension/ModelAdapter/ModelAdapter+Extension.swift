//
//  ModelAdapter+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/18.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import Foundation

/**
 数据类型
 */
enum MPModelType: Int {
    case Number
    case String
    case Bool
    case Array
    case Dictionary
    case Null
    case Unknown
}

private let mp_queue = dispatch_queue_create("mp_model_queue_serial", DISPATCH_QUEUE_SERIAL)

extension NSObject {
    
    /**
     字典转模型
     
     - parameter dic: 字典
     - returns: 模型
     */
    class func mp_dicToModel<M: Model>(dic: [String: AnyObject], model: M) -> NSObject? {
        if dic.first == nil {
            return nil
        }
//        let t = (self.classForCoder() as! NSObject.Type).init()
        let t = model
        let properties = t.mp_modelPropertyClass()
        for (k, v) in dic {
            if t.mp_getVariableWithClass(self.classForCoder(), varName: k) { //如果存在这个属性
                if t.mp_isBasic(t.mp_getType(v)) {
                    //基础类型 可以直接赋值
                    t.setValue(v, forKey: k)
                } else {
                    //复杂类型
                    let type = t.mp_getType(v)
                    if type == .Dictionary {
                        
                        //是一个对象类型
                        if let dic1 = v as? [String: AnyObject] {
                            if t.respondsToSelector(#selector(NSObject.mp_modelPropertyClass)) {
                                if let properties = properties {
                                    if  t.valueForKey(k) == nil {
                                        //初始化
                                        let obj = (properties[k] as! NSObject.Type).init()
                                        t.setValue(obj, forKey: k)
                                    }
                                }
                            }
                            if let obj = t.valueForKey(k) {
                                obj.setDicValue(dic1) //有对象就递归
                            }
                        }
                    }else if type == .Array {
                        //数组类型
                        if let arr = v as? [AnyObject] {
                            if !arr.isEmpty {
                                if t.mp_isBasic(t.mp_getType(arr.first!)) {
                                    //数组中的内容是基本类型
                                    t.setValue(arr, forKey: k)
                                } else {
                                    if t.mp_getType(arr.first!) == .Dictionary {
                                        //对象数组
                                        var objs: [NSObject] = []
                                        for dic in arr {
                                            if let properties = properties {
                                                let obj = (properties[k] as! NSObject.Type).init()
                                                objs.append(obj)
//                                                dispatch_async(mp_queue) {
                                                    //串行对列执行
                                                    obj.setDicValue(dic as! [String: AnyObject])
//                                                }
                                            }
                                        }
                                        t.setValue(objs, forKey: k)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return t
    }
    
    
    /**
     逐级递归 遍历赋值给对象
     
     - parameter dic1: 字典
     */
    func setDicValue(dic1: [String: AnyObject]) {
        for (k, v) in dic1 {
            
            if self.mp_getVariableWithClass(self.classForCoder, varName: k) {
                //判断是否存在这个属性
                if self.mp_isBasic(self.mp_getType(v)) {
                    //设置基本类型
                    if self.mp_getType(v) == .Bool {
                        //TODO: -Bool类型怎么处理  不懂
                        //                      self.setValue(Bool(v as! NSNumber), forKey: k)
                        
                    } else {
                        self.setValue(v, forKey: k)
                    }
                } else if self.mp_getType(v) == .Dictionary {
                    if let dic1 = v as? [String: AnyObject] {
                        if self.respondsToSelector(#selector(NSObject.mp_modelPropertyClass)) {
                            if let properties = self.mp_modelPropertyClass() {
                                if  self.valueForKey(k) == nil {
                                    //初始化
                                    let obj = (properties[k] as! NSObject.Type).init()
                                    self.setValue(obj, forKey: k)
                                }
                            }
                        }
                        if let obj = self.valueForKey(k) {
                            obj.setDicValue(dic1) //递归
                        }
                    }
                }
            }
        }
    }
    
    
    /**
     判断类型
     
     - parameter v: 参数
     
     - returns: 类型
     */
    private func mp_getType(v: AnyObject) -> MPModelType {
        switch v {
        case let number as NSNumber:
            if number.mp_isBool {
                return .Bool
            } else {
                return .Number
            }
        case _ as String:
            return .String
        case _ as NSNull:
            return .Null
        case _ as [AnyObject]:
            return .Array
        case _ as [String: AnyObject]:
            return .Dictionary
        default:
            return .Unknown
        }
    }
    
    
    /**
     是否为基础类型
     
     - parameter type: 类型
     
     - returns: true/false
     */
    private func mp_isBasic(type: MPModelType) -> Bool {
        if type == .Bool || type == .String || type == .Number {
            return true
        }
        return false
    }
    
    /**
     留给子类有实体属性的去继承
     
     - returns: k , 实体
     */
    func mp_modelPropertyClass() -> [String: AnyClass]? {
        return nil
    }
    
    /**
     判断对象中是否包含某个属性
     
     - parameter cls:     类
     - parameter varName: 变量名
     
     - returns: bool
     */
    func mp_getVariableWithClass(cls: AnyClass , varName: String) -> Bool{
        var outCount:UInt32 = 0
        let ivars = class_copyIvarList(cls, &outCount)
        for i in 0..<outCount {
            let property = ivars[Int(i)]
            let keyName = String.fromCString(ivar_getName(property))
            if keyName == varName {
                free(ivars)
                return true
            }
        }
        free(ivars)
        return false
    }
    
}

private let mp_trueNumber = NSNumber(bool: true)
private let mp_falseNumber = NSNumber(bool: false)
private let mp_trueObjCType = String.fromCString(mp_trueNumber.objCType)
private let mp_falseObjCType = String.fromCString(mp_falseNumber.objCType)

// MARK: - 判断是否为bool
extension NSNumber {
    var mp_isBool: Bool {
        get {
            let objCType = String.fromCString(self.objCType)
            if (self.compare(mp_trueNumber) == NSComparisonResult.OrderedSame && objCType == mp_trueObjCType)
                || (self.compare(mp_falseNumber) == NSComparisonResult.OrderedSame && objCType == mp_falseObjCType){
                return true
            } else {
                return false
            }
        }
    }
}
