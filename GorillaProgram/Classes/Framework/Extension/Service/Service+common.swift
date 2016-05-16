//
//  Service+common.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

extension Service {
    
    // MARK: Common Method
    func getNetworkService() -> NetworkService {
        return service
    }
    
    func popViewController() {
        navController.popViewControllerAnimated(true)
    }
    
    func popToRootViewController() {
        navController.popToRootViewControllerAnimated(true)
    }
    
    func controller() -> UIViewController {
        return navController
    }
    
}
