//
//  HomeViewModel.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeViewModel<S: ServiceType>: ViewModel<S, HomeDataModel> {

    // MARK: Properties
    
    
    // MARK: Initialize
    override init(service: S) {
        super.init(service: service)
    }
    
    // MARK: Private Method
    override func initDatas() {
        
    }
    
    func haha() {
        let dataModel = HomeDataModel.init()
        service.pushWithDataModel(dataModel)
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
