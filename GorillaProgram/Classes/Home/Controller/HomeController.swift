//
//  HomeController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeController<DM: DataModel>: ViewController<HomeViewModel, DM> {
    
    // MARK: Private Method
    override func initDatas() {
        service = Service.init(navController: navigationController!)
        viewModel = HomeViewModel.init(service: service)
        customView = HomeView.init()
    }

}
