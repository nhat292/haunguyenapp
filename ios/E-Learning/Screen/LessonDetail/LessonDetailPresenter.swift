//
//  LessonDetailPresenter.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class LessonDetailPresenter {
    
    var view: LessonDetailView?
    
    init(view: LessonDetailView?) {
        self.view = view
    }
    
    func lessonDetail(lessonId: Int) {
        APIServices.lessonDetail(lessonId: lessonId, beforeRequest: { (error) in
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
            if let jsonArray = data! as? [Dictionary<String, Any>] {
                let lessons = Lesson.fromJsonArray(jsonArray: jsonArray)
                self.view?.onSuccess(object: lessons)
            } else {
                self.view?.onError(message: "NetworkUnknowError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), object: nil)
            }
        }
    }
}
