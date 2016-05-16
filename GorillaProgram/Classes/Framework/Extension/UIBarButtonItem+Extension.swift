//
//  UIBarButtonItem+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa

extension UIBarButtonItem {
    
    class func itemWithImage(image: String, onClickListener: ((AnyObject!) -> Void)!) -> UIBarButtonItem {
        let button = buttonByImage(image, highImage: image)
        button.rac_signalForControlEvents(.TouchUpInside).subscribeNext(onClickListener)
        
        return UIBarButtonItem.init(customView: button)
    }
    
    class func itemWithImage(image: String, highImage: String, command: RACCommand) -> UIBarButtonItem {
        let button = buttonByImage(image, highImage: highImage)
        button.rac_command = command
        
        return UIBarButtonItem.init(customView: button);
    }
    
    class func itemWithTitle(title: String, onClickListener: ((AnyObject!) -> Void)!) -> UIBarButtonItem {
        let button = buttonByTitle(title, highTitle: title)
        button.rac_signalForControlEvents(.TouchUpInside).subscribeNext(onClickListener)
        
        return UIBarButtonItem.init(customView: button)
    }
    
    class func itemWithTitle(title: String, color: UIColor, onClickListener: ((AnyObject!) -> Void)!) -> UIBarButtonItem {
        let button = buttonByTitle(title, highTitle: title)
        button.rac_signalForControlEvents(.TouchUpInside).subscribeNext(onClickListener)
        button.setTitleColor(color, forState: .Normal)
        button.setTitleColor(color, forState: .Highlighted)
        
        return UIBarButtonItem.init(customView: button)
    }
    
    class func itemWithTitle(title: String, command: RACCommand) -> UIBarButtonItem {
        return itemWithTitle(title, highTitle: title, command: command)
    }
    
    class func itemWithTitle(title: String, highTitle: String, command: RACCommand) -> UIBarButtonItem {
        let button = buttonByTitle(title, highTitle: highTitle)
        button.rac_command = command
        
        return UIBarButtonItem.init(customView: button)
    }
    
    private class func buttonByImage(image: String, highImage: String) -> UIButton {
        let button = UIButton.init(type: .Custom)
        button.setBackgroundImage(UIImage.init(named: image), forState: .Normal)
        button.setBackgroundImage(UIImage.init(named: highImage), forState: .Highlighted)
        button.size = button.currentBackgroundImage!.size
        
        return button
    }
    
    private class func buttonByTitle(title: String, highTitle: String) -> UIButton {
        let button = UIButton.init(type: .Custom)
        button.setTitle(title, forState: .Normal)
        button.setTitle(highTitle, forState: .Highlighted)
        button.setTitleColor(UIColor.white(), forState: .Normal)
        button.setTitleColor(UIColor.white(), forState: .Highlighted)
        button.size = CGSizeMake(50, 44);
        
        return button
    }
    
}
