//
//  ChangePasswordViewControllerViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/17/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import Material

class ChangePasswordViewControllerViewController: BaseViewController {
    
    
    //textFields[0] = old password, textFields[1] = new password, textFields[2] = new password confirm
    @IBOutlet var textFields: [TextField]!
    @IBOutlet weak var btnChangePassoword: UIButton! {
        didSet {
            btnChangePassoword.layer.cornerRadius = 3
        }
    }
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewContent: UIView!
    //This constraint purpose to calculate for the view center of the screen
    @IBOutlet weak var lblChangePasswordConstraintToTop: NSLayoutConstraint!
    
    private var presenter: ChangePasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        applyLanguage()
        
        presenter = ChangePasswordPresenter(view: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    // Submit change password
    @IBAction func changePasswordPressed(_ sender: Any) {
        presenter.changePassword(oldPass: textFields[0].text!, newPass: textFields[1].text!, confirmPass: textFields[2].text!)
    }
    
    private func setup() {
        textFields.forEach { (textField) in
            textField.placeholderActiveColor = .white
            textField.placeholderNormalColor = UIColor.white.withAlphaComponent(0.5)
            textField.textColor = .white
            textField.delegate = self
            textField.isSecureTextEntry = true
        }
        let constant = (view.height - viewContent.height) / 2
        lblChangePasswordConstraintToTop.constant = constant
    }
    
    // Apply language
    private func applyLanguage() {
        textFields[0].placeholder = "PlaceHolderOldPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[1].placeholder = "PlaceHolderNewPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[2].placeholder = "PlaceHolderConfirmPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        
        lblTitle.text = "IsO-0i-K7T.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        btnChangePassoword.setTitle("SNM-ze-vyo.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
    }
}

//MARK: - UITextView Delegate
extension ChangePasswordViewControllerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFields[0] {
            _ = textFields[1].becomeFirstResponder()
        } else if textField == textFields[1] {
            _ = textFields[2].becomeFirstResponder()
        } else {
            textFields[2].endEditing(true)
        }
        return false
    }
}

//MARK: - API Results Callback
extension ChangePasswordViewControllerViewController: ChangePasswordView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func onError(message: String, object: Any?) {
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
    
    func onSuccess(object: Any?) {
        let message = object as! String
        showSimpleAlert(title: "TitleSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
}
