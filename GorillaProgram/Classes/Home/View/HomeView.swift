//
//  HomeView.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class HomeView: BaseView<HomeViewModel<HomeService>> {

    weak var viewModel: HomeViewModel<HomeService>?
    
    // MARK: Properties
    lazy private var button: UIButton = {
        let button = UIButton.init(type: .Custom)
        button.setTitle("点我,点我", forState: .Normal)
        button.setTitleColor(UIColor.black(), forState: .Normal)
        return button
    }()
    
    // MARK: Initialize
    override init() {
        super.init()
    }
    
    // MARK: Private Method
    override func bindWithViewModel(viewModel: HomeViewModel<HomeService>) {
        self.viewModel = viewModel
        button.addTarget(self, action: #selector(HomeView.onClick), forControlEvents: .TouchUpInside)
    }
    
    override func initDatas() {
        self.addSubview(self.button)
    }
    
    override func setupViews() {
        button.frame = CGRectMake(80, 80, 200, 44)
    }
    
    func onClick() {
        viewModel?.haha()
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }

}
