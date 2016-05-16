//
//  BaseViewController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class BaseViewController<DM: DataModel, VM: ViewModel, S: Service>: UIViewController {

    // MARK: Properties
    var dataModel: DM!
    var viewModel: VM!
    var service: S!
    var customView: BaseView<VM>!
    
}
