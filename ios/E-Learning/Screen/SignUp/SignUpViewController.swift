//
//  SignUpViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import Material

class SignUpViewController: BaseViewController {
    
    // textFields[0] = name, textFields[1] = phone, textFields[2] = username, textFields[3] = password, textFields[4] = confirm password, textFields[5] = email, textFields[6] = address
    @IBOutlet var textFields: [TextField]!
    // Icons at the left side correspond with textFields
    @IBOutlet var icons: [UIImageView]! {
        didSet {
            icons.forEach { (imageView) in
                imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var btnSignUp: UIButton! {
        didSet {
            btnSignUp.layer.cornerRadius = 3
        }
    }
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblSignUpConstraintToTop: NSLayoutConstraint!
    
    private var presenter: SignUpPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        applyLanguage()
        
        presenter = SignUpPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    
    @IBAction func signUpPressed(_ sender: Any) {
        presenter.signUp(name: textFields[0].text!, phone: textFields[1].text!, username: textFields[2].text!, password: textFields[3].text!, confirmPassword: textFields[4].text!, email: textFields[5].text!, address: textFields[6].text!)
    }
    
    private func setup() {
        textFields.forEach { (textField) in
            textField.placeholderActiveColor = .white
            textField.placeholderNormalColor = UIColor.white.withAlphaComponent(0.5)
            textField.textColor = .white
            textField.delegate = self
        }
        textFields[3].isSecureTextEntry = true
        textFields[4].isSecureTextEntry = true
        
        var constant = (view.height - viewContent.height) / 2
        if(constant < 50) {
            constant = 50
        }
        lblSignUpConstraintToTop.constant = constant
    }
    
    // Apply language
    private func applyLanguage() {
        textFields[0].placeholder = "PlaceHolderName".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[1].placeholder = "PlaceHolderPhone".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[2].placeholder = "PlaceHolderUsername".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[3].placeholder = "PlaceHolderPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[4].placeholder = "PlaceHolderConfirmPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[5].placeholder = "PlaceHolderEmail".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[6].placeholder = "PlaceHolderAddress".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        
        btnSignUp.setTitle("Ojm-Xo-k1k.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
        lblSignUp.text = "k1G-qL-fTl.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
    }
}

//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFields[0] {
            _ = textFields[1].becomeFirstResponder()
        } else if textField == textFields[1] {
            _ = textFields[2].becomeFirstResponder()
        } else if textField == textFields[2] {
            _ = textFields[3].becomeFirstResponder()
        }  else if textField == textFields[3] {
            _ = textFields[4].becomeFirstResponder()
        } else if textField == textFields[4] {
            _ = textFields[5].becomeFirstResponder()
        } else if textField == textFields[5] {
            _ = textFields[6].becomeFirstResponder()
        } else {
            textFields[6].endEditing(true)
        }
        return false
    }
}

//MARK: - API Results Callback
extension SignUpViewController: SignUpView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func onSuccess(object: Any?) {
        let message = object as! String
        showSimpleAlertWithCloseHandle(title: "TitleSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message) { (alert) in
            alert.dismissWithDuration(0.3)
            self.backPressed()
        }
    }
    
    func onError(message: String, object: Any?) {
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
}
