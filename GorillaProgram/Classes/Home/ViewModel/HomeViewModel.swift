//
//  HomeViewModel.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa

class HomeViewModel: ViewModel<HomeDataModel> {

    // MARK: Properties
    var buttonCommand: RACCommand?
    
    // MARK: Initialize
    override init(service: Service) {
        super.init(service: service)
    }
    
    // MARK: Private Method
    override func initDatas() {
        buttonCommand = RACCommand.init(signalBlock: { [weak self] (_) -> RACSignal! in
            return self!.buttonCommandExecute()
        })
    }
    
    private func buttonCommandExecute() -> RACSignal {
//        let (signal, observer) = Signal<String, NSError>.pipe()
//
//        signal.observeNext { (str) in
//            print("=====>>> \(str)")
//        }
//        observer.sendNext("hahahah")
        
//        let producer = countToValue(5)
//        producer.startWithNext { (index) in
//            print("=====>>> \(index)")
//        }
//        producer.startWithSignal { (observer, disposable) in
//            observer.observeNext({ (index) in
//                print("== index ===>>> \(index)")
//            })
//            observer.observeCompleted({ 
//                print("=====>>> success")
//            })
//        }
        
//        let producer = SignalProducer<Int, NSError> { (observer, disposable) in
//            
//        }
        service.getNetworkService()
            .producer(.GET, url: "https://api.github.com", params: ["": ""], model: User())
            .startWithNext { (user) in
                print("=====>>> \(user)")
            }
        
        
//        let dataModel = HomeDataModel.init(type: .Home)
//        service.pushWithDataModel(dataModel)
//        return service.getNetworkService()
//            .signalWithRequestMethid(.GET, url: "https://api.github.com", params: ["": ""], model: User())
//            .doNextAs({ (model: User) in
//
//                print("=====>>> \(model.books)")
//            })
        return RACSignal.empty()
    }
    
}
