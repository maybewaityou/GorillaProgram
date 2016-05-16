//
//  ReactiveCocoa+Extensions.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

import Foundation
import ReactiveCocoa
import Result

/*
extension RACSignal {
    func asSignal() -> Signal<AnyObject?, NSError> {
        return Signal {
            (observer: Observer<Value, Error>) in
            self.subscribeNext({
                (any: AnyObject!) -> Void in
                observer.sendNext(any)
                }, error: {
                    error in
                    observer.sendFailed(error)
                }, completed: {
                    observer.sendCompleted()
            })
        }
    }
}
*/


public func toVoidSignal<T, E>(signal: Signal<T, E>) -> Signal<(), NoError> {
    return Signal {
        sink in
        signal.observe({
            event in
            switch event {
            case .Next:
                sink.sendNext(())
            default:
                break
            }
        })
    }
}
