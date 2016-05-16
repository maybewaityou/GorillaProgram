//
//  NullableValue.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class NullableValue: ModelType, ViewModelType, ServiceType, DataModelType {
    
    func getNetworkService() -> NetworkService {
        return NetworkServiceImpl.init()
    }
    
    func setupData() {}
    
    func pushWithDataModel<DM : DataModelType>(dataModel: DM) {}
    
    func popViewController() {}
    
    func popToRootViewController() {}
    
    func controller() -> UIViewController {
        return UIViewController.init()
    }
    
}
