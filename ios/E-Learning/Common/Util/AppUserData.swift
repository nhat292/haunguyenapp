//
//  AppUserData.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class AppUserData {
    
    static let KEY_USER = "KEY_USER"
    static let KEY_USER_NAME = "KEY_USER_NAME"
    static let KEY_LANGUAGE = "KEY_LANGUAGE"
    static let KEY_LANGUAGE_CHANGED = "KEY_LANGUAGE_CHANGED"
    static let KEY_PRODUCTION = "KEY_PRODUCTION"
    
    private class func getUserDefault() -> UserDefaults {
        return UserDefaults.standard
    }
    
    class func getValue(key: String) -> Any? {
        return getUserDefault().value(forKey: key)
    }
    
    class func setValue(key: String, value: Any?) {
        let userDefault = getUserDefault()
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
}
