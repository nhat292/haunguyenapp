//
//  SignUpPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class SignUpPresenter {
    
    var view: SignUpView?
    
    init(view: SignUpView?) {
        self.view = view
    }
    
    func signUp(name: String, phone: String, username: String, password: String, confirmPassword: String, email: String, address: String) {
        if name.isEmpty {
            self.view?.onError(message: "MessagePleaseEnterName".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        if phone.isEmpty {
            self.view?.onError(message: "MessagePleaseEnterPhone".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        if username.isEmpty {
            self.view?.onError(message: "MessagePleaseEnterUsername".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        if password.isEmpty {
            self.view?.onError(message: "MessagePleaseEnterPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        if password != confirmPassword {
            self.view?.onError(message: "MessagePasswordDoesNotMatch".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        /*if email.isEmpty {
            self.view?.onError(message: "MessagePleaseEnterEmail".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }*/
        if !email.isEmpty && !email.isValidEmail() {
            self.view?.onError(message: "MessagePleaseEmailInvalid".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        APIServices.signUp(username: username, name: name, phone: phone, password: password, email: email, address: address, beforeRequest: { (error) in
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
                if let resultJson = json["ketQua"] as? Dictionary<String, Any> {
                    let result = APIError.fromJson(json: resultJson)
                    if result.message == Constants.REGISTRATION_SUCCESS {
                        AppUserData.setValue(key: AppUserData.KEY_USER_NAME, value: username)
                        self.view?.onSuccess(object: "MessageRegistrationSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
                    } else if result.message == Constants.REGISTRATION_FAIL {
                        self.view?.onError(message: "MessageRegistrationNotSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                    } else if result.message == Constants.USERNAME_EXIST {
                        self.view?.onError(message: "MessageUserExist".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                    } else if result.message == Constants.PHONE_EXIST {
                        self.view?.onError(message: "MessagePhoneExist".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                    } else {
                        self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                    }
                }
            }
        }
    }
}
