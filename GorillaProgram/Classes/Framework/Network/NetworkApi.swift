//
//  NetworkApi.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import Alamofire
import ReactiveCocoa

public enum RequestMethod: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

class NetworkApi: NSObject {
    
    // Get请求
    private class func getJsonWithRequest(url: String, completionHandler: Response<AnyObject, NSError> -> Void) {
        Alamofire.request(.GET, url).responseJSON(completionHandler: completionHandler);
    }

    // Post请求
    private class func postJsonWithRequest(url: String, params: Dictionary<String, String>, completionHandler: Response<AnyObject, NSError> -> Void) {
        let headers = [
            "":"",
            "":"",
            "":"",
        ]
        Alamofire.request(.POST, url, parameters: params, encoding: .JSON, headers: headers).responseJSON(completionHandler: completionHandler)
    }

    private class func sendRequest(method: RequestMethod, url: String, params: Dictionary<String, String>, completionHandler: Response<AnyObject, NSError> -> Void) {
        if method == .GET {
            getJsonWithRequest(url, completionHandler: completionHandler)
        } else {
            postJsonWithRequest(url, params: params, completionHandler: completionHandler)
        }
    }

    class func signalWithRequest(method: RequestMethod, url: String, params: Dictionary<String, String>) -> RACSignal {
        print("== url ===>>> \(url)")
        print("== params ===>>> \(params)")
        return RACSignal.createSignal({ (subscriber) -> RACDisposable! in
            sendRequest(method, url: url, params: params, completionHandler: { (response) -> Void in
                let result = response.result.value!

                print("== result ===>>> \(result)")

                subscriber.sendNext(result)
                subscriber.sendCompleted()

            })
            return RACDisposable.init(block: { () -> Void in
            })
        })
    }
    
}
