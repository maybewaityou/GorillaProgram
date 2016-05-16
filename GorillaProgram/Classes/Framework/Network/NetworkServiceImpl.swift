//
//  NetworkServiceImpl.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa

class NetworkServiceImpl: NetworkService {

    func signalWithRequestMethid(method: RequestMethod, url: String, params: Dictionary<String, String>) -> RACSignal {
        return NetworkApi.signalWithRequest(method, url: url, params: params)
    }
    
}
