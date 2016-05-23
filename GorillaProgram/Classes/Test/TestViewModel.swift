//
//  TestViewModel.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/23.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit
import ReactiveCocoa

class TestViewModel: ViewModel<TestDataModel> {

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
        service.pop()
        
        return RACSignal.empty()
    }
    
}
