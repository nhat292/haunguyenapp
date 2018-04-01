//
//  LessonListingPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class LessonListingPresenter {
    
    var view: LessonListingView?
    
    init(view: LessonListingView?) {
        self.view = view
    }
    
    func lessons(categoryId: Int, showLoadingFullscreen: Bool) {
        APIServices.lessons(categoryId: categoryId, beforeRequest: { (error) in
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
                let lessons = Lesson.fromJsonArray(jsonArray: jsonArray)
                self.view?.onSuccess(object: lessons)
            } else {
                self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            }
        }
    }
}
