//
//  DataModel.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

enum DataModelEnum: String {
    case Home = "home"
    case Test = "Test"
    
}

class DataModel: DataModelType {
    
    let type: DataModelEnum
    
    init(type: DataModelEnum) {
        self.type = type
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
