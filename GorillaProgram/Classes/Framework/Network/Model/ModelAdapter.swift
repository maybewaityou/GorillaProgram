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
//        let string = "{\n    \"name\": \"MeePwn\",\n    \"age\": \"2333333\",\n    \"lastName\": \"Chunnan\",\n    \"dog\": {\n        \"dogName\": \"doge\",\n        \"age\": \"11\"\n    },\n    \"books\": [\n        {\n            \"bookName\": \"Swift\",\n            \"price\": \"¥65\"\n        },\n        {\n            \"bookName\": \"Objective C\",\n            \"price\": \"¥45\"\n        },\n        {\n            \"bookName\": \"iOS\",\n            \"price\": \"¥85\"\n        }\n    ]\n}"
//        let data = string.dataUsingEncoding(NSUTF8StringEncoding)
//        do {
//            let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
//            return M.mp_dicToModel(dict as! [String : AnyObject], model: model) as! M
//        } catch {
//            return model
//        }
        return M.mp_dicToModel(result as! [String : AnyObject], model: model) as! M
    }

}
