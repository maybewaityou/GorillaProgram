//
//  ScreenAdapter.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import Device

struct ScreenAdapter {
    
    static var p_1: Int {
        get {
            return 1
        }
    }
    
    static var p_2: Int {
        get {
            return 2
        }
    }
    
    static var p_3: Int {
        get {
            return 3
        }
    }
    
    static var p_5: Int {
        get {
            return 5
        }
    }
    
    static var p_10: Int {
        get {
            return 10
        }
    }
    
    static var p_15: Int {
        get {
            return 15
        }
    }
    
    static var p_20: Int {
        get {
            return 20
        }
    }
    
    static var p_30: Int {
        get {
            return 30
        }
    }
    
    static var p_40: Int {
        get {
            return 40
        }
    }
    
    static var p_44: Int {
        get {
            return 44
        }
    }
    
    static var p_49: Int {
        get {
            return 49
        }
    }
    
    static var p_50: Int {
        get {
            return 50
        }
    }
    
    static var p_54: Int {
        get {
            return 54
        }
    }
    
    static var p_59: Int {
        get {
            return 59
        }
    }
    
    static var p_64: Int {
        get {
            return 64
        }
    }
    
    static var p_84: Int {
        get {
            return 84
        }
    }
    
    static var p_95: CGFloat {
        get {
            return 95
        }
    }
    
    static var p_120: CGFloat {
        get {
            return 120
        }
    }
    
    static var titleLeftImageHeight: CGFloat {
        get {
            return 30
        }
    }
    
    static var titleLeftImageWidth: CGFloat {
        get {
            return 95
        }
    }
    
    static var homeItemWidth: CGFloat {
        get {
            return (screenW - 80) / 3
        }
    }
    
    static var homeItemHeight: CGFloat {
        get {
            return (screenW - 80) / 3
        }
    }
    
    static var homeCollectionViewMarginTop: Int {
        get {
            if Size.Screen4Inch == Device.size() {
                return 20
            } else if Size.Screen4_7Inch == Device.size() {
                return 30
            } else if Size.Screen5_5Inch == Device.size() {
                return 40
            }
            return 20
        }
    }
    
    static var cellMarginLeft: Int {
        get {
            return 50
        }
    }
    
    static var personalRowHeigh: CGFloat {
        get {
            return 50
        }
    }
    
    static var levelDesWidth: CGFloat {
        get {
            return 140
        }
    }
    
    static var personalRightLabelWidth: Int {
        get {
            return 80
        }
    }
    
    static var marginBottom: CGFloat {
        get {
            if Size.Screen4Inch == Device.size() {
                return 70
            } else if Size.Screen4_7Inch == Device.size() {
                return 90
            } else if Size.Screen5_5Inch == Device.size() {
                return 110
            }
            return 70
        }
    }
    
}
