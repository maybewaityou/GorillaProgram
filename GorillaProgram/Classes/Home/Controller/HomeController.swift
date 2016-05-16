//
//  HomeController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeController: BaseViewController<HomeViewModel<HomeService>, HomeService, HomeDataModel> {

    // MARK: Initialize
    override init() {
        super.init()
    }
    
    // MARK: Private Method
    override func initDatas() {
        service = HomeService.init(navController: navigationController!)
        viewModel = HomeViewModel.init(service: service)
        customView = HomeView.init()
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }

}
