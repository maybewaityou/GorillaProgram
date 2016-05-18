//
//  ViewModel.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class ViewModel<DM: DataModelType>: ViewModelType {
    
    var dataModel: DM?
    var service: Service!
    
    // MARK: Initialize
    init(service: Service) {
        self.service = service
        initialize()
    }
    
    init(service: Service, dataModel: DM) {
        self.service = service
        self.dataModel = dataModel
        initialize()
    }
    
    // MARK: Private Method
    private func initialize() {
        initDatas()
    }
    
    func initDatas() {}

    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
