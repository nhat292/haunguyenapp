//
//  LoginViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 Nhat. All rights reserved.
//

import UIKit
import Material

class LoginViewController: BaseViewController {
    
    // textFields[0] = username, textFields[1] = password
    @IBOutlet var textFields: [TextField]!
    // Icons at left side of textField username and textField password
    // icons[0] = left side of username
    // icons[1] = left side of password
    @IBOutlet var icons: [UIImageView]! {
        didSet {
            icons.forEach { (imageView) in
                imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
    
    @IBOutlet weak var btnLogin: UIButton! {
        didSet {
            btnLogin.layer.cornerRadius = 3
        }
    }
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblLoginConstraintToTop: NSLayoutConstraint!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblNoAccountYet: UILabel!
    
    private var presenter: LoginPresenter!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter = LoginPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let username = AppUserData.getValue(key: AppUserData.KEY_USER_NAME) as? String {
            textFields[0].text = username
        }
        
        applyLanguage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isLogged() {
            openViewController(viewController: UINavigationController(rootViewController: LessonCategoryListingViewController()))
        }
    }
    
    //MARK: - Submit Login
    @IBAction func loginPressed(_ sender: Any) {
        presenter.login(username: textFields[0].text!, password: textFields[1].text!)
    }
    
    //MARK: - SignUp
    @IBAction func signUpPressed(_ sender: Any) {
        pushViewController(viewController: SignUpViewController())
    }
    
    private func setup() {
        textFields.forEach { (textField) in
            textField.placeholderActiveColor = .white
            textField.placeholderNormalColor = UIColor.white.withAlphaComponent(0.5)
            textField.textColor = .white
            textField.delegate = self
        }
        textFields[1].isSecureTextEntry = true
        
        let constant = (view.height - viewContent.height) / 2
        lblLoginConstraintToTop.constant = constant
    }
    
    // Apply language
    private func applyLanguage() {
        textFields[0].placeholder = "PlaceHolderUsername".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[1].placeholder = "PlaceHolderPassword".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        
        lblLogin.text = "tBw-Ke-7Df.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        lblNoAccountYet.text = "7f0-4U-IvA.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        btnLogin.setTitle("JDg-ew-m7M.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
        btnSignUp.setTitle("HAQ-ZH-c50.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
    }
    
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFields[0] {
            _ = textFields[1].becomeFirstResponder()
        } else {
            textFields[1].endEditing(true)
        }
        return false
    }
}

//MARK: - API Results Callback
extension LoginViewController: LoginView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func onSuccess(object: Any?) {
        textFields[1].text = ""
        openViewController(viewController: UINavigationController(rootViewController: LessonCategoryListingViewController()))
    }
    
    func onError(message: String, object: Any?) {
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
}

