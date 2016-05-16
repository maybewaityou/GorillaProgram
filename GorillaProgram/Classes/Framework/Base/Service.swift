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

    func pushWithDataModel<DM : DataModel>(dataModel: DM) {
        switch(dataModel.type) {
        case .Home:
            let controller = HomeController.init()
            navController.pushViewController(controller, animated: true)
        }
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
