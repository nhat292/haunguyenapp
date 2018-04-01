//
//  ProfileViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import SideMenu
import Material

class ProfileViewController: BaseSideMenuViewController {
    
    
    @IBOutlet weak var imgRoundBackground: UIImageView!
    @IBOutlet weak var viewAvatar: UIView!
    @IBOutlet weak var lblShortname: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    // Icons at the left side correspond of textFields
    @IBOutlet var icons: [UIImageView]!
    @IBOutlet weak var btnPhoneEdit: UIButton!
    @IBOutlet weak var btnAddressEdit: UIButton!
    @IBOutlet weak var btnEmailEdit: UIButton!
    @IBOutlet weak var btnNameEdit: UIButton!
    @IBOutlet weak var btnBuyVip: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    //textFields[0] = name, textFields[1] = phone, textFields[2] = address, textFields[3] = email, textFields[4] = vip expiration
    @IBOutlet var textFields: [TextField]!
    @IBOutlet weak var viewTextFieldVip: UIView!
    @IBOutlet weak var viewTextFieldVipHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnBuyVipHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnSaveHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewBetweenVipAndSave: UIView!
    @IBOutlet weak var viewAboveBtnChangePassword: UIView!
    @IBOutlet weak var btnSaveToTopConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var btnSaveToBottomConstraintHeight: NSLayoutConstraint!
    
    
    fileprivate var presenter: ProfilePresenter!
    var userJson: [String: Any]!
    var fromLesson: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        applyLanguage()
        
        presenter = ProfilePresenter(view: self)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = nil
        navigationItem.hideBackButton()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Check if language has changed
    override func onMenuClose() {
        if let languageChanged = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE_CHANGED) as? Bool {
            if languageChanged {
                applyLanguage()
            }
        }
    }
    
    // MARK: - Menu pressed
    @IBAction func menuPressed(_ sender: Any) {
        menuPressed()
    }
    
    // MARK: - Edit name pressed
    @IBAction func nameEditPressed(_ sender: Any) {
        editTextField(index: 0)
    }
    
    // MARK: - Edit phone pressed
    @IBAction func phoneEditPressed(_ sender: Any) {
        editTextField(index: 1)
    }
    
    // MARK: - Edit address pressed
    @IBAction func addressEditPressed(_ sender: Any) {
        editTextField(index: 2)
    }
    
    // MARK: - Edit email pressed
    @IBAction func emailEditPressed(_ sender: Any) {
        editTextField(index: 3)
    }

    // MARK: - buy VIP pressed
    @IBAction func buyVipPressed(_ sender: Any) {
        presenter.createURLPayment()
    }
    
    // MARK: - Save pressed
    @IBAction func savePressed(_ sender: Any) {
        disableEdit()
        presenter.update(name: textFields[0].text!, phone: textFields[1].text!, address: textFields[2].text!, email: textFields[3].text!)
    }
    
    // MARK: - Change Password pressed
    @IBAction func changePasswordPressed(_ sender: Any) {
        pushViewController(viewController: ChangePasswordViewControllerViewController())
    }
    
    
    private func setup() {
        imgRoundBackground.image = imgRoundBackground.image?.withRenderingMode(.alwaysTemplate)
        viewAvatar.layer.cornerRadius = viewAvatar.layer.frame.size.width / 2
        icons.forEach { (icon) in
            icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
        }
        btnNameEdit.setImage(UIImage(named: "pencil")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnPhoneEdit.setImage(UIImage(named: "pencil")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnAddressEdit.setImage(UIImage(named: "pencil")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnEmailEdit.setImage(UIImage(named: "pencil")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnBuyVip.layer.cornerRadius = 3
        btnSave.layer.cornerRadius = 3
        btnChangePassword.layer.cornerRadius = 3
        
        textFields.forEach { (textField) in
            textField.placeholderActiveColor = .white
            textField.placeholderNormalColor = UIColor.white.withAlphaComponent(0.5)
            textField.textColor = .white
            textField.delegate = self
            
            textField.isEnabled = false
            textField.isUserInteractionEnabled = false
        }
        
        automaticallyAdjustsScrollViewInsets = false
        
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            let user = User.fromJson(json: userJson)
            lblShortname.text = user.name.showShortName
            lblUsername.text = "@\(user.username)"
            lblName.text = user.name
            textFields[0].text = user.name
            textFields[1].text = user.phone
            textFields[2].text = user.address
            textFields[3].text = user.email
            if Constants.IS_PRODUCTION {
                if isVip() {
                    hideVipButton()
                    textFields[4].text = Constants.VIP_DUE_DAY
                } else {
                    showVipButton()
                }
            }
            self.userJson = userJson
        }
        hideSaveButton()
        
        // Check is the app is not production
        if !Constants.IS_PRODUCTION {
            viewTextFieldVip.isHidden = true
            viewTextFieldVipHeightConstraint.constant = 0
            btnBuyVip.isHidden = true
            btnBuyVipHeightConstraint.constant = 0
            viewAboveBtnChangePassword.isHidden = true
        }
    }
    
    private func editTextField(index: Int) {
        textFields[index].isEnabled = true
        textFields[index].isUserInteractionEnabled = true
        _ = textFields[index].becomeFirstResponder()
        showSaveButton()
    }
    
    private func showVipButton() {
        viewTextFieldVip.isHidden = true
        viewTextFieldVipHeightConstraint.constant = 0
        btnBuyVip.isHidden = false
        btnBuyVipHeightConstraint.constant = 50
        animateIfNeeded()
    }
    
    fileprivate func hideVipButton() {
        viewTextFieldVip.isHidden = false
        viewTextFieldVipHeightConstraint.constant = 60
        btnBuyVip.isHidden = true
        btnBuyVipHeightConstraint.constant = 0
        viewAboveBtnChangePassword.isHidden = true
        animateIfNeeded()
    }
    
    private func showSaveButton() {
        btnSave.isHidden = false
        btnSaveHeightConstraint.constant = 50
        if btnBuyVip.isHidden {
            viewBetweenVipAndSave.isHidden = true
        } else {
            viewBetweenVipAndSave.isHidden = false
        }
        btnSaveToTopConstraintHeight.constant = 10
        btnSaveToBottomConstraintHeight.constant = 10
        viewAboveBtnChangePassword.isHidden = false
        animateIfNeeded()
    }
    
    fileprivate func hideSaveButton() {
        btnSave.isHidden = true
        btnSaveHeightConstraint.constant = 0
        btnSaveToTopConstraintHeight.constant = 0
        btnSaveToBottomConstraintHeight.constant = 0
        viewBetweenVipAndSave.isHidden = true
        if isVip() || !Constants.IS_PRODUCTION {
            viewAboveBtnChangePassword.isHidden = true
        }
        animateIfNeeded()
    }
    
    private func animateIfNeeded() {
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    // Apply language
    private func applyLanguage() {
        textFields[0].placeholder = "PlaceHolderName".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[1].placeholder = "PlaceHolderPhone".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[2].placeholder = "PlaceHolderAddress".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[3].placeholder = "PlaceHolderEmail".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        textFields[4].placeholder = "PlaceHolderVipDue".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        
        btnBuyVip.setTitle("IHP-xX-AYE.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
        btnSave.setTitle("9FH-m0-JF3.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
        btnChangePassword.setTitle("xN4-Ad-s0X.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
    }
    
    // Disable all TextTields
    fileprivate func disableEdit() {
        textFields.forEach { (textField) in
            textField.isEnabled = false
            textField.isUserInteractionEnabled = false
        }
    }
}

//MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        disableEdit()
        return false
    }
}

//MARK: - API Results Callback
extension ProfileViewController: ProfileView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func onSuccess(object: Any?) {
        hideSaveButton()
        userJson["HoTen"] = textFields[0].text!
        userJson["SoDienThoai"] = textFields[1].text!
        userJson["DiaChi"] = textFields[2].text!
        userJson["Email"] = textFields[3].text!
        AppUserData.setValue(key: AppUserData.KEY_USER, value: userJson)
        lblName.text = textFields[0].text!
        let message = object as! String
        showSimpleAlert(title: "TitleSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
    
    //MARK: - Create URL payment
    func onCreateURLSuccess(url: String) {
        let paymentVC = PaymentViewController()
        paymentVC.url = url
        paymentVC.profileVC = self
        pushViewController(viewController: paymentVC)
    }
    
    //MARK: - Buy vip succeed
    func onBuyVipSuccess(expireDay: String) {
        hideVipButton()
        Constants.VIP_DUE_DAY = expireDay
        textFields[4].text = expireDay
        userJson["DenNgay"] = expireDay
        AppUserData.setValue(key: AppUserData.KEY_USER, value: userJson)
        showSimpleAlertWithCloseHandle(title: "TitleSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: "MessageBuyVipSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)) { (alert) in
             alert.dismissAlertView()
            if self.fromLesson {
                self.backPressed()
            }
        }
    }
    
    func onError(message: String, object: Any?) {
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
}

//MARK: - Process payment
extension ProfileViewController {
    
    func processPayment(payerID: String, paymentID: String) {
        presenter.processPayment(payerID: payerID, paymentID: paymentID)
    }
    
}
