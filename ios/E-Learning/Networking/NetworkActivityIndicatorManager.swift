//
//  NetworkActivityIndicatorManager.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//


import UIKit

class NetworkActivityIndicatorManager: NSObject {
    
    private static var loadingCount = 0

    class func networkOperationStarted() {
        
        #if os(iOS)
            if loadingCount == 0 {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                loadingCount += 1
            }
        #endif
    }
    
    class func networkOperationFinished() {
        #if os(iOS)
            if loadingCount > 0 {
                loadingCount -= 1
            }
            if loadingCount == 0 {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        #endif
    }
}
