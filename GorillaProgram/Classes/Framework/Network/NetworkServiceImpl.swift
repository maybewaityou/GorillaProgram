//
//  NetworkServiceImpl.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa
import RxSwift

class NetworkServiceImpl: NetworkService {

    /** RxSwift */
    func observable<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> Observable<M> {
        return NetworkApi.observable(method, url: url, params: params, model: model)
    }
    
    /** RAC 4+ */
    func producer<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> SignalProducer<M, NSError> {
        return NetworkApi.producer(method, url: url, params: params, model: model)
    }
    
    /** RAC 3+ */
    func signal<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> RACSignal {
        return NetworkApi.signal(method, url: url, params: params, model: model)
    }
    
}
