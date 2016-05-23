//
//  ViewController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class ViewController<VM: ViewModelType, DM: DataModelType>: UIViewController {

    // MARK: Properties
    var dataModel: DM?
    var viewModel: VM!
    var service: Service!
    var customView: View<VM>!
    
    // MARK: Initialize
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(viewModel: VM, dataModel: DM) {
        self.init()
        self.viewModel = viewModel
        self.dataModel = dataModel
    }
    
    convenience init(viewModel: VM) {
        self.init()
        self.viewModel = viewModel
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
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
