//
//  NullableValue.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class NullableValue: ModelType, ViewModelType, ServiceType, DataModelType {
    
    func network() -> NetworkService {
        return NetworkServiceImpl.init()
    }
    
    func setupData() {}
    
    func push<DM : DataModelType>(dataModel: DM) {}
    
    func pop() {}
    
    func popToRoot() {}
    
    func controller() -> UIViewController {
        return UIViewController.init()
    }
    
}
