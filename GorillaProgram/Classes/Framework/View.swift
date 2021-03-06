//
//  View.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class View<VM: ViewModelType>: UIView {

    // MARK: Initialize
    init() {
        super.init(frame: CGRectZero)
        initialize()
    }
    
    // MARK: Private Method
    private func initialize() {
        initDatas()
        setupViews()
    }
    
    func initDatas() {}
    func setupViews() {}
    func bindWithViewModel(viewModel: VM) {}
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
