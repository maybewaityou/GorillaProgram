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

    func signal<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> RACSignal {
        return NetworkApi.signal(method, url: url, params: params, model: model)
    }
    
    func producer<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> SignalProducer<M, NSError> {
        return NetworkApi.producer(method, url: url, params: params, model: model)
    }
    
}
