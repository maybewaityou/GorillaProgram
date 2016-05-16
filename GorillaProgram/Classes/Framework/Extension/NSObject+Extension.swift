//
//  NSObject+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import SwiftyJSON

extension NSObject {

    convenience init(jsonObject: JSON) {
        let object = jsonObject["object"]
        let dictionary = object[0].dictionaryObject
        let dict = dictionary as! [String: String]
        
        self.init(dictionary: dict)
    }
    
    convenience init(dictionary: [String: String]) {
        self.init()
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &count)
        // Swift中类型是严格检查的，必须转换成同一类型
        for i in 0 ..< Int(count) {
            // UnsafeMutablePointer<objc_property_t>是
            // 可变指针，因此properties就是类似数组一样，可以
            // 通过下标获取
            let property = properties[i]
            let name = property_getName(property)
            
            // 这里还得转换成字符串
            let strName = String.fromCString(name);
            self.setValue(dictionary[strName!], forKey: strName!)
        }
        
        // 释放内存，否则C语言的指针很容易成野指针的
        free(properties)
        
    }
    
}
