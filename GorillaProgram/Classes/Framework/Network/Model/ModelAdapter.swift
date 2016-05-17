//
//  ModelAdapter.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/17.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ModelAdapter {
    
    /** 字典转模型
     let github = ModelAdapter.model(result, model: Github()) */
    class func model<M: Model>(result: AnyObject, model: M) -> M {
        
        let dict = [
            "name": "MeePwn",
            "age": "2333333",
            "lastName": "Chunnan",
            "dog": "{\n        \"dogName\": \"doge\",\n        \"age\": \"11\"\n    }",
            "books": "[\n        {\n            \"bookName\": \"Swift\",\n            \"price\": \"¥65\"\n        },\n        {\n            \"bookName\": \"Objective C\",\n            \"price\": \"¥45\"\n        },\n        {\n            \"bookName\": \"iOS\",\n            \"price\": \"¥85\"\n        }\n    ]"
        ]
        
        let ss = M.yy_modelWithDictionary(dict)
        return ss!
    }

}
