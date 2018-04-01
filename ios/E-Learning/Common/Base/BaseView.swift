//
//  BaseView.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//


import Foundation
protocol BaseView {
    func showLoading()
    func hideLoading()
    func onError(message: String, object: Any?)
    func onSuccess(object: Any?)
}
