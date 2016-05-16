//
//  HomeController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeController: ViewController<HomeViewModel, Service, HomeDataModel> {

    // MARK: Initialize
    override init() {
        super.init()
    }
    
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
