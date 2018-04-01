//
//  ProfileView.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/17/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

protocol ProfileView: BaseView {
    
    func onCreateURLSuccess(url: String)
    
    func onBuyVipSuccess(expireDay: String)
}
