//
//  HomeViewModel.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeViewModel: ViewModel<HomeDataModel> {

    // MARK: Properties
    
    
    // MARK: Initialize
    override init(service: Service) {
        super.init(service: service)
    }
    
    // MARK: Private Method
    override func initDatas() {
        
    }
    
    func haha() {
        let dataModel = HomeDataModel.init(type: .Home)
        service.pushWithDataModel(dataModel)
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
