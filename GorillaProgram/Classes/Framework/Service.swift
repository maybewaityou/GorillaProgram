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

    func push(controller: UIViewController) {
        navController.pushViewController(controller, animated: true)
    }
    
    func push<DM : DataModel, VM : ViewModel<DM>>(dataModel: DM, controller: ViewController<VM, DM>, viewModel: VM) {
        controller.viewModel = viewModel
        controller.dataModel = dataModel
        navController.pushViewController(controller, animated: true)
    }
    
    func push<DM : DataModel>(dataModel: DM) {
        switch dataModel.type {
        case .Home:
            let controller = HomeController.init(dataModel: dataModel)
            navController.pushViewController(controller, animated: true)
        case .Test:
            let viewModel = TestViewModel.init(service: self)
            let controller = TestController.init(viewModel: viewModel, dataModel: dataModel)
            navController.pushViewController(controller, animated: true)
        }
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
