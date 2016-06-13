//
//  UITextField+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/6/6.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

extension UITextField {
    
    var placeholderColor: UIColor? {
        set {
            let oldHolder = self.placeholder
            self.placeholder = " "
            self.placeholder = oldHolder
            
            if let value = newValue {
                self.setValue(value, forKeyPath: "placeholderLabel.textColor")
            } else {
                let defaultColor = UIColor.init(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
                self.setValue(defaultColor, forKeyPath: "placeholderLabel.textColor")
            }
        }
        get {
            return self.valueForKeyPath("placeholderLabel.textColor") as? UIColor
        }
    }
    
}
