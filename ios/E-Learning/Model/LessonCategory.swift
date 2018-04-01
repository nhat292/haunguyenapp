//
//  LessonCategory.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class LessonCategory {
    
    var id: Int
    var name: String
    var description: String
    var totalLesson: Int
    
    init(id: Int, name: String, description: String, totalLesson: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.totalLesson = totalLesson
    }
    
    class func fromJsonArray(jsonArray: [Dictionary<String, Any>]) -> [LessonCategory] {
        var lessonCategories = [LessonCategory]()
        if jsonArray.count > 0 {
            for i in 0..<jsonArray.count {
                let json = jsonArray[i] 
                let id = json["idDanhMucBaiHoc"] as! Int
                let name = json["TenDanhMuc"] as! String
                let description = json["MoTa"] as! String
                let totalLesson = json["tongSoBaiHoc"] as! Int
                lessonCategories.append(LessonCategory(id: id, name: name, description: description, totalLesson: totalLesson))
            }
        }
        return lessonCategories
    }
}
