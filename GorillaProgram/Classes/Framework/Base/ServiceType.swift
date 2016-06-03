//
//  ServiceType.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

protocol ServiceType {
    
    func network() -> NetworkService
    
    func push<DM : DataModel>(dataModel: DM)
    
    func pop()
    
    func popToRoot()
    
    func controller() -> UIViewController
    
    func dismiss()
    
}
