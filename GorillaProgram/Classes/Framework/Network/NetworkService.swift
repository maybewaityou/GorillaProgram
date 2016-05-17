//
//  NetworkService.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa

protocol NetworkService {
    
    func signalWithRequestMethid<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> RACSignal
    
}
