//
//  URLConfig.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class URLConfig {
    private static var config: URLConfig?
    static var share: URLConfig {
        get {
            if URLConfig.config == nil { URLConfig.config = URLConfig() }
            return URLConfig.config!
        }
    }
    
    private var plistValue: NSDictionary {
        get {
            var myDict: NSDictionary!
            if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
                myDict = NSDictionary(contentsOfFile: path)!
            }
            return myDict
        }
    }
    
    var baseURL: String {
        return plistValue["baseURL"] as! String
    }
    
    var mediaBaseURL: String {
        return plistValue["mediaBaseURL"] as! String
    }
}
