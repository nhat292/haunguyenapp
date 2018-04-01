//
//  Constants.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static let DEV_MOD = false
    
    //OTHERS
    static var OPEN_LOGIN_WHEN_SELECT_LAGUAGE_VC_DID_APPEAR = false
    
    //MARK - Font size
    static let FONT_SIZE_VERY_LARGE: CGFloat = 18
    static let FONT_SIZE_LARGE: CGFloat = 17
    static let FONT_SIZE_NORMAL: CGFloat = 15
    static let FONT_SIZE_SMALL: CGFloat = 14
    
    //COLORS
    static let APP_ACCENT_COLOR: UIColor = 0x000000.toUIColor
    
    //API ERROR
    static let USERNAME_OR_PASSWORD_NOT_CORRECT = "ERR_USER_001"
    static let REGISTRATION_FAIL = "ERR_USER_002"
    static let USERNAME_EXIST = "ERR_USER_003"
    static let PHONE_EXIST = "ERR_USER_004"
    static let OLD_PASSWORD_INCORRECT = "ERR_USER_005"
    static let REGISTRATION_SUCCESS = "INFO_USER_001"
    static let UPDATE_SUCCESS = "INFO_USER_002"
    static let INVALID_ERROR = "ERR_SYSTEM_001"
    
    //API STATUS
    static let API_STATUS_SUCCESS = 1
    static let API_STATUS_ERROR = 0
    
    //LANGUAGE
    static var CURRENT_LANGUAGE = "vi" //Value changable at runtime
    static let DEFAULT_LOCALIZABLE = "Localizable"
    
    //VIP
    static var VIP_DUE_DAY: String = "" //Value changable at runtime
    static var IS_PRODUCTION: Bool = false //Value changable at runtime
    
}
