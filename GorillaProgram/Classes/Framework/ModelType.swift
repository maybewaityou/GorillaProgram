//
//  ModelType.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

protocol ModelType {

    // 解析Json之后,生成attrs字典,将attrs字典赋值给Model的属性
    func setupData()
    
}
