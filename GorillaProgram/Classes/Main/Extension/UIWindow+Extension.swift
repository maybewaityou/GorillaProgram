//
//  UIWindow+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func switchRootController() {
        let tabBarController = TabBarController()
        rootViewController = tabBarController
    }
    
}
