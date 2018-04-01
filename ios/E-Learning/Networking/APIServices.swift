//
//  APIServices.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class APIServices {
    
    static let ACTION_LOGIN = "/KhachHang/dangnhap"
    static let ACTION_SIGN_UP = "/KhachHang/dangky"
    static let ACTION_LESSON_CATEGORIES = "/DanhMuc/danhsach"
    static let ACTION_LESSONS = "/BaiHoc/danhsach"
    static let ACTION_LESSON_DETAIL = "/BaiHoc/chitiet"
    static let ACTION_UPDATE = "/KhachHang/capnhat"
    static let ACTION_CHANGE_PASSWORD = "/KhachHang/doimatkhau"
    static let ACTION_ENROLL = "/KhachHang/datlich"
    static let ACTION_ABOUT = "/GioiThieu"
    
    static let ACTION_PAYMENT_CREATE_URL = "/Payment/taoURLpaypal"
    static let ACTION_PAYMENT_PROCESS = "/Payment/xuly"
    static let ACTION_PAYMENT_BUY_VIP = "/Payment/muavip"
    static let ACTION_CHECK_VIP_EXPIRE_DAY = "/KhachHang/ngayhethan"
    
    //MARK: - Login
    class func login(username: String, password: String, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var params = Dictionary<String, Any>()
        params["TenDangNhap"] = username
        params["MatKhau"] = password
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_LOGIN, params: params, method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - SignUp
    class func signUp(username: String, name: String, phone: String, password: String, email: String, address: String, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var params = Dictionary<String, Any>()
        params["HoTen"] = name
        params["SoDienThoai"] = phone
        params["TenDangNhap"] = username
        params["MatKhau"] = password
        params["Email"] = email
        params["DiaChi"] = address
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_SIGN_UP, params: params, method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Update Information
    class func update(name: String, phone: String, address: String, email: String, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var params = Dictionary<String, Any>()
        params["HoTen"] = name
        params["SoDienThoai"] = phone
        params["Email"] = email
        params["DiaChi"] = address
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            params["idKhachHang"] = User.fromJson(json: userJson).id
        }
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_UPDATE, params: params, method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Enroll
    class func enroll(time: String, content: String, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var params = Dictionary<String, Any>()
        params["thoiGian"] = time
        params["noiDung"] = content
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            params["idKhachHang"] = User.fromJson(json: userJson).id
        }
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_ENROLL, params: params, method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Change Password
    class func changePassword(oldPass: String, newPass: String, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var params = Dictionary<String, Any>()
        params["matKhauCu"] = oldPass
        params["matKhauMoi"] = newPass
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            params["idKhachHang"] = User.fromJson(json: userJson).id
        }
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_CHANGE_PASSWORD, params: params, method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - About
    class func about(beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        let urlEndPoint = "\(ACTION_ABOUT)?lang=\(Constants.CURRENT_LANGUAGE)"
        APIResquest.startBackgroundRequest(urlEndPoint: urlEndPoint, params: [:], method: .get, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Lesson Categories
    class func lessonCategories(beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var lang = "vi"
        if let langSave = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE) as? String {
            lang = langSave
        }
        let endPoint = "\(ACTION_LESSON_CATEGORIES)?lang=\(lang)"
        APIResquest.startBackgroundRequest(urlEndPoint: endPoint, params: [:], method: .get, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Lessons
    class func lessons(categoryId: Int, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var lang = "vi"
        if let langSave = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE) as? String {
            lang = langSave
        }
        let endPoint = "\(ACTION_LESSONS)?idDanhMuc=\(categoryId)&lang=\(lang)"
        APIResquest.startBackgroundRequest(urlEndPoint: endPoint, params: [:], method: .get, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Lesson's Detail
    class func lessonDetail(lessonId: Int, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var lang = "vi"
        if let langSave = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE) as? String {
            lang = langSave
        }
        let endPoint = "\(ACTION_LESSON_DETAIL)?idBaiHoc=\(lessonId)&lang=\(lang)"
        APIResquest.startBackgroundRequest(urlEndPoint: endPoint, params: [:], method: .get, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Create Url Payment
    class func createURLPayment(beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_PAYMENT_CREATE_URL, params: [:], method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Process Payment
    class func processPayment(payerId: String, paymentID: String, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var params = Dictionary<String, Any>()
        params["payerId"] = payerId
        params["paymentId"] = paymentID
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_PAYMENT_PROCESS, params: params, method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Buy Vip
    class func buyVip(key: String, token: String, beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var params = Dictionary<String, Any>()
        params["key"] = key
        params["token"] = token
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            params["idKhachHang"] = User.fromJson(json: userJson).id
        }
        APIResquest.startBackgroundRequest(urlEndPoint: ACTION_PAYMENT_BUY_VIP, params: params, method: .post, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Check VIP Expiration
    class func checkVipExpireDay(beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        var userId = 0
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            userId = User.fromJson(json: userJson).id
        }
        let endPoint = "\(ACTION_CHECK_VIP_EXPIRE_DAY)?idKhachHang=\(userId)"
        APIResquest.startBackgroundRequest(urlEndPoint: endPoint, params: [:], method: .get, beforeRequest: beforeRequest, dataResponse: response)
    }
    
    //MARK: - Check production
    class func checkProduction(beforeRequest: APIResquest.BeforeRequest?, response: APIResquest.Response?) {
        APIResquest.checkProduction(beforeRequest: beforeRequest, dataResponse: response)
    }

}
