//
//  ChangePasswordPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/17/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class ChangePasswordPresenter {
    
    var view: ChangePasswordView?
    
    init(view: ChangePasswordView?) {
        self.view = view
    }
    
    func changePassword(oldPass: String, newPass: String, confirmPass: String) {
        if oldPass.isEmpty {
            view?.onError(message: "MessagePleaseEnterCurrentPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        
        if newPass.isEmpty {
            view?.onError(message: "MessagePleaseEnterNewPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        
        if newPass != confirmPass {
            view?.onError(message: "MessagePasswordDoesNotMatch".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        
        APIServices.changePassword(oldPass: oldPass, newPass: newPass, beforeRequest: { (error) in
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
                        self.view?.onSuccess(object: "MessageChangePasswordSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
                    } else {
                        let error = APIError.fromJson(json: resultJson)
                        if error.message == Constants.OLD_PASSWORD_INCORRECT {
                            self.view?.onError(message: "MessageOldPasswordIncorrect".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                        } else {
                            self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                        }
                    }
                }
            }
        }
    }
}
