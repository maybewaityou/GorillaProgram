//
//  NullableValue.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class NullableValue: Model, ViewModel, Service, DataModel {
    
    func setupData() {}
    
    func pushWithDataModel<DM : DataModel>(dataModel: DM) {}
    
    func popViewController() {}
    
    func popToRootViewController() {}
    
}
