//
//  TestController.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/23.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class TestController<DM: DataModel>: ViewController<TestViewModel, DM> {

    // MARK: Private Method
    override func initDatas() {
        customView = TestView.init()
    }
    
}
