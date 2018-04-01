//
//  User.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

class User {
    
    var id: Int
    var name: String
    var phone: String
    var username: String
    var email: String
    var address: String
    var vipDueDay: String
    
    init(id: Int, name: String, phone: String, username: String, email: String, address: String, vipDueDay: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.username = username
        self.email = email
        self.address = address
        self.vipDueDay = vipDueDay
    }
    
    class func fromJson(json: Dictionary<String, Any>) -> User {
        let id = json["idKhachHang"] as! Int
        let name = json["HoTen"] as! String
        let phone = json["SoDienThoai"] as! String
        let username = json["TenDangNhap"] as! String
        var email = ""
        if let em = json["Email"] as? String {
            email = em
        }
        var address = ""
        if let ad = json["DiaChi"] as? String {
            address = ad
        }
        var vipDueDay: String = ""
        if let vipDay = json["DenNgay"] as? String {
            vipDueDay = vipDay
        }
        return User(id: id, name: name, phone: phone, username: username, email: email, address: address, vipDueDay: vipDueDay)
    }
}
