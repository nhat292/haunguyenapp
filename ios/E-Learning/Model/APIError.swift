//
//  APIError.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class APIError {
    
    var type: String
    var message: String
    var cause: String
    
    init(type: String, message: String, cause: String) {
        self.type = type
        self.message = message
        self.cause = cause
    }
    
    class func fromJson(json: Dictionary<String, Any>) -> APIError {
        let type = json["Type"] as! String
        let message = json["Message"] as! String
        let cause = json["Cause"] as! String
        return APIError(type: type, message: message, cause: cause)
    }
}
