//
//  Method+Swizzling.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

extension NSObject {
    
    public class func swizzleClassMethodWithClass(cls: AnyClass!, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getClassMethod(cls, originalSelector)
        let swizzledMethod = class_getClassMethod(cls, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    
    public class func swizzleInstanceMethodWithClass(cls: AnyClass!, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    
}

extension UIFont {
    
    public class func mp_systemFontOfSize(fontSize: CGFloat) -> UIFont {
        // TODO: 按比例缩放字体
        print("==fontSize===>>> \(fontSize)")
        return systemFontOfSize(fontSize)
    }
    
    
}

extension UIViewController {
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = #selector(UIViewController.viewDidLoad)
            let swizzledSelector = #selector(UIViewController.mp_viewDidLoad)
            
            self.swizzleInstanceMethodWithClass(self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
        }
    }
    
    // MARK: - Method Swizzling
    func mp_viewDidLoad() {
        self.mp_viewDidLoad()
    }
    
}

