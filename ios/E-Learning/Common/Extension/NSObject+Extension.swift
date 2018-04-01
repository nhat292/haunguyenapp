//
//  NSObject+Extension.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    func addTapGestureRecognizer(view: UIView, ac: Selector?) {
        let gesture = UITapGestureRecognizer(target: self, action: ac)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
    }
    
}
