//
//  LoginPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    var view: LoginView?
    
    init(view: LoginView?) {
        self.view = view
    }
    
    func login(username: String, password: String) {
        if username.isEmpty {
            view?.onError(message: "MessagePleaseEnterUsername".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        if password.isEmpty {
            view?.onError(message: "MessagePleaseEnterPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        
        APIServices.login(username: username, password: password, beforeRequest: { (error) in
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
                
                if var resultJson = json["ketQua"] as? Dictionary<String, Any> {
                    if status == Constants.API_STATUS_SUCCESS {
                        let user = User.fromJson(json: resultJson)
                        self.view?.onSuccess(object: user)
                        if user.vipDueDay.isEmpty {
                            resultJson["DenNgay"] = ""
                        }
                        if user.email.isEmpty {
                            resultJson["Email"] = ""
                        }
                        if user.address.isEmpty {
                            resultJson["DiaChi"] = ""
                        }
                        AppUserData.setValue(key: AppUserData.KEY_USER, value: resultJson)
                        AppUserData.setValue(key: AppUserData.KEY_USER_NAME, value: username)
                    } else {
                        let error = APIError.fromJson(json: resultJson)
                        if error.message == Constants.USERNAME_OR_PASSWORD_NOT_CORRECT {
                            self.view?.onError(message: "MessageUsernameOrPasswordIncorrect".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                        } else {
                            self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                        }
                    }
                }
            }
        }
    }
}
