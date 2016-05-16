//
//  BaseViewModel.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

struct BaseViewModel<S: Service, DM: DataModel>: ViewModel {
    
    var dataModel: DM?
    var service: S!
    
    // MARK: Initialize
    init(service: S) {
        self.service = service
        initialize()
    }
    
    init(service: S, dataModel: DM) {
        self.service = service
        self.dataModel = dataModel
        initialize()
    }
    
    // MARK: Private Method
    private func initialize() {
        initDatas()
    }
    
    func initDatas() {}

}
