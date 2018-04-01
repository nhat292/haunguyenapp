//
//  LeftMenuViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import SideMenu

class LeftMenuViewController: BaseViewController {
    
    @IBOutlet weak var viewUserAvatar: UIView!
    @IBOutlet weak var lblUserShortname: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var btnLessonCategories: UIButton!
    @IBOutlet weak var btnPersonalInformation: UIButton!
    @IBOutlet weak var btnEnrollMakup: UIButton!
    @IBOutlet weak var btnChangeLanguage: UIButton!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        applyLanguage(language: Constants.CURRENT_LANGUAGE)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Send update to viewControllers those extend from BaseSideMenuViewController
        NotificationCenter.default.post(name: Notification.Name("SideMenu"), object: nil, userInfo: ["Open": true])
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //Send update to viewControllers those extend from BaseSideMenuViewController
        NotificationCenter.default.post(name: Notification.Name("SideMenu"), object: nil, userInfo: ["Open": false])
    }
    
    //MARK: - Lesson Categories
    @IBAction func lessonCategoriesPressed(_ sender: Any) {
        pushViewController(viewController: LessonCategoryListingViewController())
    }
    
    //MARK: - Personal Information
    @IBAction func personalInformationPressed(_ sender: Any) {
        pushViewController(viewController: ProfileViewController())
    }
    
    //MARK: -  Enroll
    @IBAction func enrollPressed(_ sender: Any) {
        pushViewController(viewController: EnrollMakupViewController())
    }
    
    //MARK: - Change language
    @IBAction func changeLanguagePressed(_ sender: Any) {
        let languageVC = LanguageDialogViewController()
        languageVC.confirm = { (type, data) in
            let language = data as! String
            if !language.isEmpty {
                AppUserData.setValue(key: AppUserData.KEY_LANGUAGE, value: language)
                AppUserData.setValue(key: AppUserData.KEY_LANGUAGE_CHANGED, value: true)
                Constants.CURRENT_LANGUAGE = language
                self.applyLanguage(language: language)
            }
        }
        languageVC.modalPresentationStyle = .overFullScreen
        self.present(languageVC, animated: false, completion: {
            languageVC.showAnimation()
        })
    }
    
    //MARK: - About
    @IBAction func aboutPressed(_ sender: Any) {
        pushViewController(viewController: AboutViewController())
    }
    
    //MARK: - Logout
    @IBAction func logoutPressed(_ sender: Any) {
        showConfirmAlert(title: "TitleLogOut".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: "ConfirmLogout".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), okButtonHandler: { (alert) in
            alert.dismissAlertView()
            AppUserData.setValue(key: AppUserData.KEY_USER, value: nil)
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            Constants.OPEN_LOGIN_WHEN_SELECT_LAGUAGE_VC_DID_APPEAR = true
        }) { (alert) in
            alert.dismissAlertView()
        }
    }
    
    private func setup() {
        viewUserAvatar.layer.cornerRadius = viewUserAvatar.layer.frame.size.width / 2
        
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            let user = User.fromJson(json: userJson)
            lblUserShortname.text = user.name.showShortName
            lblUsername.text = "@\(user.username)"
        }
    }
    
    // Apply language
    private func applyLanguage(language: String) {
        btnLessonCategories.setTitle("P16-D8-dJK.normalTitle".localized(lang: language, tableName: String(describing: type(of: self))), for: .normal)
        btnPersonalInformation.setTitle("X0k-ko-093.normalTitle".localized(lang: language, tableName: String(describing: type(of: self))), for: .normal)
        btnEnrollMakup.setTitle("vsU-EN-7rM.normalTitle".localized(lang: language, tableName: String(describing: type(of: self))), for: .normal)
        btnChangeLanguage.setTitle("aJY-Gf-nfE.normalTitle".localized(lang: language, tableName: String(describing: type(of: self))), for: .normal)
        btnAbout.setTitle("gQ6-D9-ua1.normalTitle".localized(lang: language, tableName: String(describing: type(of: self))), for: .normal)
        btnLogout.setTitle("dKp-Ki-DDU.normalTitle".localized(lang: language, tableName: String(describing: type(of: self))), for: .normal)
    }
}
