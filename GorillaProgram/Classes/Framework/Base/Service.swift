//
//  Service.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class Service: ServiceType {

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
    
    func controller() -> UIViewController {
        return navController
    }

    func pushWithDataModel<DM : DataModel>(dataModel: DM) {
        switch(dataModel.type) {
        case .Home:
            print("=====>>> \(dataModel.type.rawValue)")
        }
        let controller = HomeController.init()
        navController.pushViewController(controller, animated: true)
        
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
