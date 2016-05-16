//
//  NavigationController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

    override class func initialize() {
        super.initialize()
        
        let navBar = UINavigationBar.appearance()
        var textAttrs = [String: UIColor]()
        textAttrs[NSForegroundColorAttributeName] = titleTextColor
        navBar.titleTextAttributes = textAttrs
        navBar.barTintColor = titleBackgroundColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 自定义UIBarButtonItem导致系统自带的右滑退出失效
        // 一下为解决方案
        if self.respondsToSelector(Selector("interactivePopGestureRecognizer")) {
            self.interactivePopGestureRecognizer?.delegate = self
            self.delegate = self
        }
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.respondsToSelector(Selector("interactivePopGestureRecognizer")) {
            self.interactivePopGestureRecognizer?.enabled = false
        }
        if self.viewControllers.count > 0 {
            //            let leftBar = UIBarButtonItem.itemWithImage("back", onClickListener: { [weak self] (_) -> Void in
            //                self!.popViewControllerAnimated(true)
            //                })
            //            viewController.navigationItem.leftBarButtonItem = leftBar
            viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        if self.respondsToSelector(Selector("interactivePopGestureRecognizer")) {
            self.interactivePopGestureRecognizer?.enabled = true
        }
        
        if self.viewControllers.count == 1 {
            self.interactivePopGestureRecognizer?.enabled = false
            self.interactivePopGestureRecognizer?.delegate = nil;
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
