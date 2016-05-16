//
//  HomeService.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeService: Service {

    override func pushWithDataModel<DM : DataModelType>(dataModel: DM) {
        let controller = HomeController.init()
        
        navController.pushViewController(controller, animated: true)
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
