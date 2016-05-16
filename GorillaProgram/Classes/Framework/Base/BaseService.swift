//
//  BaseService.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class BaseService: ServiceType {

    // MARK: Properties
    weak var navController: UINavigationController!
    var service: NetworkServiceImpl = {
        return NetworkServiceImpl()
    }()
    
    // MARK: Initialize
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    // MARK: Private Method
    func getNetworkService() -> NetworkService {
        return service
    }
    
    func popViewController() {
        navController.popViewControllerAnimated(true)
    }
    
    func popToRootViewController() {
        navController.popToRootViewControllerAnimated(true)
    }
    
    func pushWithDataModel<DM : DataModelType>(dataModel: DM) {}
    
    func controller() -> UIViewController {
        return navController
    }
    
}
