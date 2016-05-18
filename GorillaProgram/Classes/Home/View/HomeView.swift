//
//  HomeView.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeView: View<HomeViewModel> {

    weak var viewModel: HomeViewModel?
    
    // MARK: Properties
    lazy private var button: UIButton = {
        let button = UIButton.init(type: .Custom)
        button.setTitle("点我,点我", forState: .Normal)
        button.setTitleColor(UIColor.black(), forState: .Normal)
        return button
    }()
    
    // MARK: Private Method
    override func bindWithViewModel(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        button.rac_command = viewModel.buttonCommand
    }
    
    override func initDatas() {
        self.addSubview(self.button)
    }
    
    override func setupViews() {
        button.frame = CGRectMake(80, 80, 200, 44)
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }

}
