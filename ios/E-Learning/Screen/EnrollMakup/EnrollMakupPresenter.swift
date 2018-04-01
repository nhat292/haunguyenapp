//
//  EnrollMakupPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/19/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class EnrollMakupPresenter {
    
    var view: EnrollMakupView?
    
    init(view: EnrollMakupView?) {
        self.view = view
    }
    
    func enroll(time: String, content: String) {
        if time.isEmpty {
            view?.onError(message: "MessageEnrollTimeEnpty".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        
        if content.isEmpty {
            view?.onError(message: "MessageEnrollContentEnpty".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        APIServices.enroll(time: time, content: content, beforeRequest: { (error) in
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            self.view?.showLoading()
        }) { (error, data) in
            self.view?.hideLoading()
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            if let json = data! as? Dictionary<String, Any> {
                let status = json["thanhCong"] as! Int
                if let resultJson = json["ketQua"] as? Dictionary<String, Any> {
                    if status == Constants.API_STATUS_SUCCESS {
                        self.view?.onSuccess(object: "MessageEnrollSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
                    } else {
                        let error = APIError.fromJson(json: resultJson)
                        if error.message == Constants.INVALID_ERROR {
                            self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                        } else {
                            self.view?.onError(message: "MessageEnrollError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                        }
                    }
                }
            }
        }
    }
    
}
