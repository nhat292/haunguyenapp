//
//  LessonCategoriesPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class LessonCategoriesPresenter {
    
    var view: LessonCategoryView?
    
    init(view: LessonCategoryView?) {
        self.view = view
    }
    
    func loadLessonCategories(showLoadingFullscreen: Bool) {
        APIServices.lessonCategories(beforeRequest: { (error) in
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            if showLoadingFullscreen {
                self.view?.showLoading()
            }
        }) { (error, data) in
            if showLoadingFullscreen {
                self.view?.hideLoading()
            } else {
                self.view?.hideIndicatorLoading()
            }
            if error != nil {
                self.view?.onError(message: error!, object: nil)
                return
            }
            if let jsonArray = data! as? [Dictionary<String, Any>] {
                let lessonCategories = LessonCategory.fromJsonArray(jsonArray: jsonArray)
                self.view?.onSuccess(object: lessonCategories)
            } else {
                self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            }
        }
    }
    
    func checkVipExpireDay() {
        APIServices.checkVipExpireDay(beforeRequest: { (error) in
            if error != nil {
                return
            }
        }) { (error, data) in
            if error != nil {
                return
            }
            if let json = data as? Dictionary<String, Any> {
                if let expirationDay = json["ngayHetHan"] as? String {
                    if var userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
                        userJson["DenNgay"] = expirationDay
                        AppUserData.setValue(key: AppUserData.KEY_USER, value: userJson)
                    }
                }
            }
        }
    }
    
    func checkProduction() {
        APIServices.checkProduction(beforeRequest: { (error) in
            if error != nil {
                return
            }
        }) { (error, data) in
            if error != nil {
                return
            }
            if let production = data as? Int {
                if production == 1 {
                    Constants.IS_PRODUCTION = true
                    AppUserData.setValue(key: AppUserData.KEY_PRODUCTION, value: true)
                }
            }
        }
    }
}
