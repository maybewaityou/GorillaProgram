//
//  FileManager.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/6/13.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class FileManager {

    class func getSize(path: String) -> Int {
        let manager = NSFileManager.defaultManager()
        let subpaths = manager.subpathsAtPath(path)
        
        var size = 0
        
        for subpath in subpaths! {
            let fullSubpath = path + "/" + subpath
            
            do {
                let attrs = try manager.attributesOfItemAtPath(fullSubpath)
                size += (attrs[NSFileSize] as! Int)
            } catch {}
        }
        return size
    }

    class func getCachesSize() -> Int {
        let cachesPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
        return getSize(cachesPath!)
    }
    
}
