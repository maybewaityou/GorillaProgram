//
//  HomeService.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeService: BaseService {

    override func pushWithDataModel<DM : DataModel>(dataModel: DM) {
        let controller = UIViewController.init()
        
        navController.pushViewController(controller, animated: true)
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
