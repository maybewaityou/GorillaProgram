//
//  String+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/6/13.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

extension String {

    func getFileSize() -> Int {
        var size = 0
        let manager = NSFileManager.defaultManager()
        
        do {
            let attrs = try manager.attributesOfItemAtPath(self)
            if (attrs[NSFileType] as! String) == NSFileTypeDirectory {
                let subpaths = manager.subpathsAtPath(self)
                
                for subpath in subpaths! {
                    let fullSubpath = self + "/" + subpath
                    
                    do {
                        let attrs = try manager.attributesOfItemAtPath(fullSubpath)
                        size += (attrs[NSFileSize] as! Int)
                    } catch {}
                }
            } else {
                size += (attrs[NSFileSize] as! Int)
            }
        } catch {}
        
        return size
    }
    
    func getCachesSize() -> Int {
        let cachesPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
        return cachesPath!.getFileSize()
    }

    
}
