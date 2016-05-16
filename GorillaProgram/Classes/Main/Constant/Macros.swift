//
//  Macros.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

let deviceIdentifier = (UIDevice.currentDevice().identifierForVendor?.UUIDString)!

/*============================================================================*/
let loginSuccessNotification = "loginSuccessNotification"
let logoutSuccessNotification = "logoutSuccessNotification"
let chooseCompanyNotification = "chooseCompanyNotification"
let uploadImageNotification = "uploadImageNotification"
/*============================================================================*/

/*============================================================================*/
//let noticeString: MutableProperty<String> = {
//    return MutableProperty("")
//}()
//var isLogin = false
//let updatePhotoUrl: MutableProperty<String> = {
//    return MutableProperty("")
//}()
//var authorization: Authorization? // 权限
//var dicts: [Dict]? // 查询代码字典
/*============================================================================*/

/*============================================================================*/
let screenW = UIScreen.mainScreen().bounds.size.width
let screenH = UIScreen.mainScreen().bounds.size.height
/*============================================================================*/

/*============================================================================*/
let textSmallSize: CGFloat = 14.0

/*============================================================================*/

/*============================================================================*/
let defaultBackgroundColor = UIColor.whiteColor()
let titleBackgroundColor = UIColor.init(hexString: "#009271")
let titleTextColor = UIColor.white()
let darkGreenColor = UIColor.init(hexString: "#009271")!
let tabBarItemTextColor = UIColor.init(hexString: "#505050")
let tabBarItemSelectedTextColor = UIColor.init(hexString: "#009271")
let defaultColor = UIColor.init(hexString: "#bebebe")
let buttonTextColor = UIColor.white()
let defaultTextColor = UIColor.init(hexString: "#505050")
let lightTextColor = UIColor.white()
let orangeColor = UIColor.init(hexString: "#f86722")
let lightGreenColor = UIColor.init(hexString: "#009271")
/*============================================================================*/

/*============================================================================*/
//let baseUrl = "http://192.168.1.108:8080"
let baseUrl = "http://10.100.0.170:7080"
//let baseUrl = "http://ks.cphr.com.cn"
let baseImageServerUrl = "http://stor.cphr.com.cn/"
let registerSecurityUrl = "\(baseUrl)/minterf/reg_m"
let registerUrl = "\(baseUrl)/minterf/regSave_m?"
let loginUrl = "\(baseUrl)/minterf/dologin_m?sessionid=\(deviceIdentifier)"
let logoutUrl = "\(baseUrl)/minterf/exit?sessionid=\(deviceIdentifier)"
let perfactResumeMenuUrl = "\(baseUrl)/minterf/checkMenuByRcode?sessionid=\(deviceIdentifier)"
let submitResumeMenuUrl = "\(baseUrl)/minterf/m_ndkh?sessionid=\(deviceIdentifier)&mid=14bf5730d4cf411690231245d8fcce42"
let perfactResumeSubMenuUrl = "\(baseUrl)/minterf/checkData?sessionid=\(deviceIdentifier)&resourceCode="
let perfactResumeMenuDetailsUrl = "\(baseUrl)/minterf/checkMenu?sessionid=\(deviceIdentifier)&resourceCode="
let perfactResumeAddMenuDetailsUrl = "\(baseUrl)/minterf/addData?sessionid=\(deviceIdentifier)&resourceCode="
let perfactResumeUpdateMenuDetailsUrl = "\(baseUrl)/minterf/upData?sessionid=\(deviceIdentifier)&resourceCode="
let perfactResumeDeleteMenuDetailsUrl = "\(baseUrl)/minterf/deleData?sessionid=\(deviceIdentifier)&resourceCode="
let dictionaryUrl = "\(baseUrl)/minterf/readDic?dickey="
let authorizedUrl = "\(baseUrl)/minterf/checkRole?sessionid=\(deviceIdentifier)"

let uploadUrl = "\(baseUrl)/minterf/imageUpload"
let checkSMJUrl = "\(baseUrl)/minterf/checkSMJ?SMJID="
let deleteSMJUrl = "\(baseUrl)/minterf/deleSMJ?ID="
let deleteAllSMJUrl = "\(baseUrl)/minterf/deleAllSMJ"
let orderSMJUrl = "\(baseUrl)/minterf/sortForSMJ"
/*============================================================================*/

