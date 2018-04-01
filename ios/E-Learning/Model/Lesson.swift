//
//  Lesson.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class Lesson {
    
    var id: Int
    var categoryId: Int
    var categoryName: String
    var name: String
    var image: String
    var videoName: String
    var video: String
    var content: String
    
    init(id: Int, categoryId: Int, categoryName: String, name: String, image: String, videoName: String, video: String, content: String) {
        self.id = id
        self.categoryId = categoryId
        self.categoryName = categoryName
        self.name = name
        self.image = image
        self.videoName = videoName
        self.video = video
        self.content = content
    }
    
    class func fromJsonArray(jsonArray: [Dictionary<String, Any>]) -> [Lesson] {
        var lessons = [Lesson]()
        if jsonArray.count > 0 {
            for i in 0..<jsonArray.count {
                let json = jsonArray[i]
                let id = json["idBaiHoc"] as! Int
                let categoryId = json["idDanhMucBaiHoc"] as! Int
                let categoryName = json["TenDanhMuc"] as! String
                let name = json["TenBaiHoc"] as! String
                let image = json["HinhDaiDien"] as! String
                let videoName = json["TenViDeo"] as! String
                let video = json["Video"] as! String
                let content = json["NoiDung"] as! String
                lessons.append(Lesson(id: id, categoryId: categoryId, categoryName: categoryName, name: name, image: image, videoName: videoName, video: video, content: content))
            }
        }
        return lessons
    }

}
