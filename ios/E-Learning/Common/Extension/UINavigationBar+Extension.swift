//
//  UINavigationBar+Extension.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
    
    func offTransparentNavigationBar() {
        self.barTintColor = UIColor.white
        self.isTranslucent = false
        self.barTintColor = Constants.APP_ACCENT_COLOR
    }
}
