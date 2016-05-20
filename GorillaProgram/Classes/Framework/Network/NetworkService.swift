//
//  NetworkService.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa
import RxSwift

protocol NetworkService {
    
    /** RxSwift */
    func observable<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> Observable<M>
    
    /** RAC 4+ */
    func producer<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> SignalProducer<M, NSError>
    
    /** RAC 3+ */
    func signal<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> RACSignal
}
