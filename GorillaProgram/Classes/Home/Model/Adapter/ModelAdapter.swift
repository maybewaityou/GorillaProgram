//
//  ModelAdapter.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/17.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa
import SwiftyJSON
import Alamofire

class ModelAdapter {
    
    /** 字典转模型
     let github = ModelAdapter.model(response, model: Github()) */
    class func model<M: Model>(response: Response<AnyObject, NSError>, model: M) -> M {
        let result = response.result.value!
        
        print("=====>>> \(result)")
        
        let json = JSON.init(result)
        setupData(json.dictionaryValue, model: model)
        return model
    }
    
    /** 字典转模型
     let github = ModelAdapter.model(json, model: Github()) */
    class func model<M: Model>(json: JSON, model: M) -> M {
        setupData(json.dictionaryValue, model: model)
        return model
    }
    
    /* 解析Json之后,生成attrs字典,将attrs字典赋值给Model的属性 */
    private class func setupData<M: Model>(dictionary: [String: JSON], model: M) {
        var count: UInt32 = 0
        let properties = class_copyPropertyList(model.classForCoder, &count)
        // Swift中类型是严格检查的，必须转换成同一类型
        for i in 0 ..< Int(count) {
            // UnsafeMutablePointer<objc_property_t>是
            // 可变指针，因此properties就是类似数组一样，可以
            // 通过下标获取
            let property = properties[i]
            let name = property_getName(property)
            
            // 这里还得转换成字符串
            let strName = String.fromCString(name);
            model.setValue(dictionary[strName!]!.stringValue, forKey: strName!)
        }
        
        // 释放内存，否则C语言的指针很容易成野指针的
        free(properties)
        
    }

}
