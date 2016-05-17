//
//  ModelAdapter.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/17.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ModelAdapter: NSObject {
    
    class func model<T: Model>(t: T) {
        RACSignal.empty().subscribeNextAs { (t: T) in
            
        }
    }

}
