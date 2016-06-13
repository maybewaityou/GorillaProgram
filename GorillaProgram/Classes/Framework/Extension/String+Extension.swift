//
//  String+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/6/13.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

extension String {

    private func getFileSize() -> Int {
        let manager = NSFileManager.defaultManager()
        let subpaths = manager.subpathsAtPath(self)
        
        var size = 0
        
        for subpath in subpaths! {
            let fullSubpath = self + "/" + subpath
            
            do {
                let attrs = try manager.attributesOfItemAtPath(fullSubpath)
                size += (attrs[NSFileSize] as! Int)
            } catch {}
        }
        return size
    }
    
    func getCachesSize() -> Int {
        let cachesPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
        return cachesPath!.getFileSize()
    }

    
}
