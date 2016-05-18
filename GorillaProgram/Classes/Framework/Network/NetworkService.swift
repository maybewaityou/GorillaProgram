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
    
    func signal<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> RACSignal
    
    /* RAC 4+ */
    func producer<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> SignalProducer<M, NSError>
}
