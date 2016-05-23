//
//  TestView.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/23.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class TestView: View<TestViewModel> {

    weak var viewModel: TestViewModel?
    
    // MARK: Properties
    lazy private var button: UIButton = {
        let button = UIButton.init(type: .Custom)
        button.setTitle("haha", forState: .Normal)
        button.setTitleColor(UIColor.black(), forState: .Normal)
        return button
    }()
    
    // MARK: Private Method
    override func bindWithViewModel(viewModel: TestViewModel) {
        self.viewModel = viewModel
        button.rac_command = viewModel.buttonCommand
    }
    
    override func initDatas() {
        self.addSubview(self.button)
    }
    
    override func setupViews() {
        button.frame = CGRectMake(80, 80, 200, 44)
    }

}
