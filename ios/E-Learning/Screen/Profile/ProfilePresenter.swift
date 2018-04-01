//
//  ProfilePresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/17/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class ProfilePresenter {
    
    var view: ProfileView?
    
    init(view: ProfileView?) {
        self.view = view
    }
    
    func update(name: String, phone: String, address: String, email: String) {
        if name.isEmpty {
            self.view?.onError(message: "MessagePleaseEnterName".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            return
        }
        if phone.isEmpty {
            self.view?.onError(message: "MessagePleaseEnterPhone".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
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
        
        APIServices.update(name: name, phone: phone, address: address, email: email, beforeRequest: { (error) in
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
                    if result.message == Constants.UPDATE_SUCCESS {
                        self.view?.onSuccess(object: "MessageUpdateSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
                    } else {
                        self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                    }
                }
            }
        }
    }
    
    
    func createURLPayment() {
        APIServices.createURLPayment(beforeRequest: { (error) in
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
            if let url = data as? String {
                self.view?.onCreateURLSuccess(url: url)
            } else {
                self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            }
        }
    }
    
    func processPayment(payerID: String, paymentID: String) {
        APIServices.processPayment(payerId: payerID, paymentID: paymentID, beforeRequest: { (error) in
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            self.view?.showLoading()
        }) { (error, data) in
            if error != nil {
                self.view?.hideLoading()
                self.view?.onError(message: error!, object: nil)
                return
            }
            if let jsonData = data as? Dictionary<String, Any> {
                if let key = jsonData["key"] as? String, let token = jsonData["token"] as? String  {
                    self.buyVip(key: key, token: token)
                    return
                }
            }
            self.view?.hideLoading()
            self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
        }
    }
    
    private func buyVip(key: String, token: String) {
        APIServices.buyVip(key: key, token: token, beforeRequest: { (error) in
            if error != nil {
                self.view?.hideLoading()
                self.view?.onError(message: error!, object: nil)
                return
            }
        }) { (error, data) in
            self.view?.hideLoading()
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            if let json = data! as? Dictionary<String, Any> {
                let status = json["thanhCong"] as! Int
                if status == Constants.API_STATUS_SUCCESS {
                    var expireDay: String = ""
                    if let eDay = json["ngayHetHan"] as? String {
                        expireDay = eDay
                    }
                    self.view?.onBuyVipSuccess(expireDay: expireDay)
                } else {
                    self.view?.onError(message: "MessageVipAlready".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
                }
            } else {
                self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            }
        }
    }
}
