//
//  AlertUtils.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation
import UIKit

typealias Confirm = (Int, Any?) -> ()
class AlertUtils {
    
    class func textFieldAlert(title: String?, message: String?, keyboardType: UIKeyboardType, placeholder: String, confirm: Confirm?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.applyAppStyle()
        alert.addTextField { (textField) in
            textField.font = UIFont.systemFont(ofSize: 15)
            textField.textAlignment = .center
            textField.placeholder = placeholder
            textField.keyboardType = keyboardType
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (a) in
            confirm?(0, alert.textFields![0].text!)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert) in
            confirm?(1, nil)
        }))
        return alert
    }
    
    class func alert(title: String?, message: String?, ok: String?, cancel: String?, confirm: Confirm?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.applyAppStyle()
        if ok != nil {
            alert.addAction(UIAlertAction(title: ok, style: .default, handler: { (a) in
                confirm?(0, nil)
            }))
        }
        if cancel != nil {
            alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: { (alert) in
                confirm?(1, nil)
            }))
        }
        return alert
    }
    
}
