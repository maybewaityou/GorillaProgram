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
    
    // MARK: Initialize
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(dataModel: DM) {
        self.init()
        self.dataModel = dataModel
    }
    
    // MARK: Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    // MARK: Private Method
    private func initialize() {
        initDatas()
        setupTitle()
        setupViews()
        bindWithViewModel(viewModel)
    }
    
    func bindWithViewModel(viewModel: VM) {
        customView.bindWithViewModel(viewModel)
    }
    
    func initDatas() {}
    
    func setupTitle() {}
    
    func setupViews() {
        customView.backgroundColor = defaultBackgroundColor
        customView.frame = UIScreen.mainScreen().bounds
        view.addSubview(customView)
    }
    
}
