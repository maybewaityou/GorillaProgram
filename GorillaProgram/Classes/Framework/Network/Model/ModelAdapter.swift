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

class ModelAdapter {
    
    /** 字典转模型
     let github = ModelAdapter.model(result, model: Github()) */
    class func model<M: Model>(result: AnyObject, model: M) -> M {
        let str = "{\n" +
            "    \"name\": \"MeePwn\",\n" +
            "    \"age\": \"2333333\",\n" +
            "    \"lastName\": \"Chunnan\",\n" +
            "    \"dog\": {\n" +
            "        \"dogName\": \"doge\",\n" +
            "        \"age\": \"11\"\n" +
            "    },\n" +
            "    \"books\": [\n" +
            "        {\n" +
            "            \"bookName\": \"Swift\",\n" +
            "            \"price\": \"¥65\"\n" +
            "        },\n" +
            "        {\n" +
            "            \"bookName\": \"Objective C\",\n" +
            "            \"price\": \"¥45\"\n" +
            "        },\n" +
            "        {\n" +
            "            \"bookName\": \"iOS\",\n" +
            "            \"price\": \"¥85\"\n" +
            "        }\n" +
            "    ]\n" +
        "}"
        
        
        
        let json = JSON.init(str)
        setupData(dictWithJSON(json), model: model)
        return model
    }
    
    private class func model<M: Model>(json: JSON, model: M) -> M {
        setupData(dictWithJSON(json), model: model)
        return model
    }
    
    /* [String: JSON] -> [String: String] */
    private class func dictWithJSON(json: JSON) -> [String: String] {
        var dict = [String: String]()
        for (key, subJson): (String, JSON) in json {
            dict[key] = subJson.stringValue
        }
        return dict
    }
    
    private class func arrayWithJSON(json: JSON) {
        
    }
    
    /* 解析Json之后,生成attrs字典,将attrs字典赋值给Model的属性 */
    private class func setupData<M: Model>(dictionary: [String: String], model: M) {
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
            model.setValue(dictionary[strName!], forKey: strName!)
        }
        
        // 释放内存，否则C语言的指针很容易成野指针的
        free(properties)
        
    }

}
