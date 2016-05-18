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
    func network() -> NetworkService {
        return service
    }
    
    func pop() {
        navController.popViewControllerAnimated(true)
    }
    
    func popToRoot() {
        navController.popToRootViewControllerAnimated(true)
    }
    
    func controller() -> UIViewController {
        return navController
    }
    
}
