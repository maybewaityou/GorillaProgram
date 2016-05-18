//
//  HomeController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeController: ViewController<HomeViewModel, HomeDataModel> {
    
    // MARK: Private Method
    override func initDatas() {
        service = Service.init(navController: navigationController!)
        viewModel = HomeViewModel.init(service: service)
        customView = HomeView.init()
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }

}
