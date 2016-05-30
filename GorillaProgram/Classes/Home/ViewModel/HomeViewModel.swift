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
//        service.network()
//            .observable(.GET, url: "https://api.github.com", params: ["": ""], model: User())
//            .subscribeNext { (user) in
//                print("=====>>> \(user.dog?.dogName)")
//            }.addDisposableTo(rx_disposeBag)
//        service.network()
//            .producer(.GET, url: "https://api.github.com", params: ["": ""], model: User())
//            .startWithNext { (user) in
//                print("=====>>> \(user)")
//            }
//        return RACSignal.empty()
        let dataModel = TestDataModel.init(type: .Test)
        service.push(dataModel)
        return service.network()
            .signal(.GET, url: "https://api.github.com", params: ["": ""], model: Github())
            .doNextAs({ (model: Github) in
                print("=====>>> \(model.authorizations_url)")
            })
    }
    
}
