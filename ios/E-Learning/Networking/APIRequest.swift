//
//  APIResquest.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation
import Alamofire


class APIResquest {
    
    typealias Error = String
    typealias Data = Any?
    typealias BeforeRequest = (Error?) -> ()
    typealias Response = (Error?, Data?) -> ()
    
    class func startBackgroundRequest(urlEndPoint: String, params: Dictionary<String, Any>, method: HTTPMethod, beforeRequest: BeforeRequest?, dataResponse: Response? ) {
        if let beforeRequest = beforeRequest {
            if !NetworkUtil.isOnline() {
                beforeRequest("NetworkErrorConnection".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
                return
            }
            beforeRequest(nil)
        }
        let url = "\(URLConfig.share.baseURL)\(urlEndPoint)"
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers(token: "")).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let data = response.result.value {
                    if let jsonObjectData = data as? Dictionary<String, Any> {
                        responseObject(dataResponse: dataResponse, error: nil, data: jsonObjectData)
                    } else if let jsonArrayData = data as? [Dictionary<String, Any>] {
                        responseObject(dataResponse: dataResponse, error: nil, data: jsonArrayData)
                    } else if let stringData = data as? String {
                        responseObject(dataResponse: dataResponse, error: nil, data: stringData)
                    } else {
                        responseObject(dataResponse: dataResponse, error: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                    }
                } else {
                    responseObject(dataResponse: dataResponse, error: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                }
            case .failure(let error):
                if !NetworkUtil.isOnline() {
                    responseObject(dataResponse: dataResponse, error: "NetworkErrorConnection".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                } else if error._code == NSURLErrorTimedOut {
                    responseObject(dataResponse: dataResponse, error: "NetworkConnectionTimeOut".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                } else {
                    responseObject(dataResponse: dataResponse, error: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                }
            }
        }
    }
    
    class func checkProduction(beforeRequest: BeforeRequest?, dataResponse: Response? ) {
        if !NetworkUtil.isOnline() {
            return
        }
        let url = "http://homeandhome.com.vn/apps/check" // This is temporary api for enable and disable production
        Alamofire.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: headers(token: "")).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let data = response.result.value {
                    if let production = data as? Int { // 0 development, 1 production
                        responseObject(dataResponse: dataResponse, error: nil, data: production)
                    }
                }
            case .failure( _): break
                
            }
        }
    }

    class func startUpload(urlEndPoint: String, params: Dictionary<String, Any>, image: UIImage?, fileName: String, beforeRequest: BeforeRequest?, dataResponse: Response? ) {
        if let beforeRequest = beforeRequest {
            if !NetworkUtil.isOnline() {
                beforeRequest("NetworkErrorConnection".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
                return
            }
            beforeRequest(nil)
        }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            if let image = image {
                multipartFormData.append(UIImageJPEGRepresentation(image, 1)!, withName: "avatar", fileName: fileName, mimeType: "image/jpeg")
            }
            for (key, value) in params {
                let v = String(describing: value)
                multipartFormData.append(v.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, usingThreshold: UInt64.init(), to: URLConfig.share.baseURL + urlEndPoint, method: .post, headers: headers(token: "")) { (multipartFormDataResult) in
            switch (multipartFormDataResult) {
            case .success(let upload, _, _):
                upload.responseJSON(completionHandler: { (response) in
                    
                })
            case .failure(let error):
                if !NetworkUtil.isOnline() {
                    responseObject(dataResponse: dataResponse, error: "NetworkErrorConnection".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                } else if error._code == NSURLErrorTimedOut {
                    responseObject(dataResponse: dataResponse, error: "NetworkConnectionTimeOut".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                } else {
                    responseObject(dataResponse: dataResponse, error: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), data: nil)
                }
            }
        }
    }
    
    private class func responseObject(dataResponse: Response?, error: Error?, data: Data?) {
        if let response = dataResponse {
            response(error, data)
        }
    }
    
    class func headers(token: String) -> [String: String] {
        return ["Api-Token": token, "Content-Type" : "application/x-www-form-urlencoded"]
    }
}
