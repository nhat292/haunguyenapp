//
//  AboutViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import SideMenu

class AboutViewController: BaseSideMenuViewController {
    
    @IBOutlet weak var imgRoundBackground: UIImageView!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var txtAbout: UITextView!
    
    
    var presenter: AboutPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        applyLanguage()
        
        presenter = AboutPresenter(view: self)
        
        if let content = AppUserData.getValue(key: "ABOUT-\(Constants.CURRENT_LANGUAGE)") as? String {
            txtAbout.attributedText = content.attributedStringFromHtml
            presenter.loadAbout(showLoading: false)
        } else {
            presenter.loadAbout(showLoading: true)
        }
    }
    
    // Check for language changing
    override func onMenuClose() {
        if let languageChanged = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE_CHANGED) as? Bool {
            if languageChanged {
                applyLanguage()
                presenter.loadAbout(showLoading: false)
            }
        }
    }
    
    // Apply language
    private func applyLanguage() {
        lblAbout.text = "Dd8-Lg-o79.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
    }
    
    private func setup() {
        imgRoundBackground.image = imgRoundBackground.image?.withRenderingMode(.alwaysTemplate)
        txtAbout.text = ""
        txtAbout.layer.cornerRadius = 3
    }

}

//MARK: - API Results Callback
extension AboutViewController: AboutView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func showNetworkIndicator() {
        NetworkActivityIndicatorManager.networkOperationStarted()
    }
    
    func hideNetworkIndicator() {
        NetworkActivityIndicatorManager.networkOperationFinished()
    }
    
    func onError(message: String, object: Any?) {
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
    
    func onSuccess(object: Any?) {
        guard let content = object as? String else {
            return
        }
        AppUserData.setValue(key: "ABOUT-\(Constants.CURRENT_LANGUAGE)", value: content)
        txtAbout.attributedText = content.attributedStringFromHtml
    }
}
