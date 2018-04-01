//
//  AboutPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/20/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class AboutPresenter {
    
    var view: AboutView?
    
    init(view: AboutView?) {
        self.view = view
    }
    
    func loadAbout(showLoading: Bool) {
        APIServices.about(beforeRequest: { (error) in
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            if showLoading {
                self.view?.showLoading()
            } else {
                self.view?.showNetworkIndicator()
            }
        }) { (error, data) in
            if showLoading {
                self.view?.hideLoading()
            } else {
                self.view?.hideNetworkIndicator()
            }
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            if let jsonData = data as? Dictionary<String, Any> {
                if let content = jsonData["NoiDung"] as? String {
                    self.view?.onSuccess(object: content)
                    return
                }
            }
            self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
        }
    }
}
