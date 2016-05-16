//
//  ServiceType.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

protocol ServiceType {
    
    func getNetworkService() -> NetworkService
    
    func pushWithDataModel<DM : DataModel>(dataModel: DM)
    
    func popViewController()
    
    func popToRootViewController()
    
    func controller() -> UIViewController
    
}
