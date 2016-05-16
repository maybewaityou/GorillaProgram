//
//  BaseView.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class BaseView<VM: ViewModel>: UIView {

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
    
}
