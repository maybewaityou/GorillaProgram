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
import Async

public enum RequestMethod: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

class NetworkApi: NSObject {

/*====================================== Common Method Start ======================================*/
    /** 配置证书 */
    class func configureCertificate() {
        allowAllCertificate()
    }
    
    /** 公共请求方法 */
    class func producer<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> SignalProducer<M, NSError> {
        print("== url ===>>> \(url)")
        print("== params ===>>> \(params)")
        return SignalProducer<M, NSError> { (observer, disposable) -> () in
            Async.background(block: {
                sendRequest(method, url: url, params: params, completionHandler: { (response) -> Void in
                    let result = response.result.value!
                    
                    print("=====>>> \(result)")
                    
                    observer.sendNext(ModelAdapter.model(result, model: model))
                    observer.sendCompleted()
                })
            })
        }
        .startOn(QueueScheduler.init())
        .observeOn(UIScheduler.init())
    }
    
    /** 公共请求方法 */
    class func signalWithRequest<M: Model>(method: RequestMethod, url: String, params: Dictionary<String, String>, model: M) -> RACSignal {
        print("== url ===>>> \(url)")
        print("== params ===>>> \(params)")
        return RACSignal.createSignal({ (subscriber) -> RACDisposable! in
            Async.background(block: {
                sendRequest(method, url: url, params: params, completionHandler: { (response) -> Void in
                    let result = response.result.value!
                    
                    print("=====>>> \(result)")
                    
                    subscriber.sendNext(ModelAdapter.model(result, model: model))
                    subscriber.sendCompleted()
                })
            })
            return RACDisposable.init(block: { () -> Void in
            })
        })
        .subscribeOn(RACScheduler.immediateScheduler())
        .deliverOn(RACScheduler.mainThreadScheduler())
    }
/*====================================== Common Method End ======================================*/

/*====================================== Private Method Start ======================================*/
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
/*====================================== Private Method End ======================================*/

/*====================================== Configure Certificate Start ======================================*/
    /** 允许所有证书 */
    private class func allowAllCertificate() {
        let manager = Manager.sharedInstance
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: NSURLSessionAuthChallengeDisposition = .PerformDefaultHandling
            var credential: NSURLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = NSURLSessionAuthChallengeDisposition.UseCredential
                credential = NSURLCredential(forTrust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .CancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.URLCredentialStorage?.defaultCredentialForProtectionSpace(challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .UseCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }
/*====================================== Configure Certificate Start ======================================*/
    
}
