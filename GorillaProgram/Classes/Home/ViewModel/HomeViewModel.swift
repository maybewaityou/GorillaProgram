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
        let dataModel = HomeDataModel.init(type: .Home)
        service.pushWithDataModel(dataModel)
        return service.getNetworkService()
            .signalWithRequestMethid(.GET, url: "https://api.github.com", params: ["": ""])
            .doNext({ (result) in
                
            })
    }
    
    deinit {
        print("== deinit ===>>> \(self)")
    }
    
}
