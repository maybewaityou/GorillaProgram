//
//  TabBarController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfigs()
    }
    
    // MARK: Private Method
    private func setupConfigs() {
        let homeController = HomeController.init()
        let personalController = HomeController.init()
        let helpController = HomeController.init()
        
        setupControllers(homeController, title: "年度考核", image: "home", selectedImage: "home_checked")
        setupControllers(personalController, title: "账号信息", image: "personal_center", selectedImage: "personal_center_checked")
        setupControllers(helpController, title: "系统帮助", image: "system_help", selectedImage: "system_help_checked")
    }
    
    func setupControllers(controller: UIViewController, title: String, image: String, selectedImage: String) {
        controller.title = title
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage.init(named: image)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        let leftTitleImageView = UIImageView.init(image: UIImage.init(named: "home_title_image"))
        //                leftTitleImageView.bounds = CGRectMake(0, 0, ScreenAdapter.titleLeftImageWidth, ScreenAdapter.titleLeftImageHeight)
        let leftBar = UIBarButtonItem.init(customView: leftTitleImageView)
        controller.navigationItem.leftBarButtonItem = leftBar
        
        var textAttrs = [String: UIColor]()
        textAttrs[NSForegroundColorAttributeName] = tabBarItemTextColor
        var selectedAttrs = [String: UIColor]()
        selectedAttrs[NSForegroundColorAttributeName] = tabBarItemSelectedTextColor
        
        UITabBarItem.appearance().setTitleTextAttributes(textAttrs, forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttrs, forState: .Selected)
        UITabBar.appearance().tintColor = tabBarItemSelectedTextColor
        
        let navController = NavigationController.init(rootViewController: controller)
        self.addChildViewController(navController)
    }

}
