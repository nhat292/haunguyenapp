//
//  SelectLanguageViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/18/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit

class SelectLanguageViewController: BaseViewController {
    
    @IBOutlet weak var stackVietNam: UIStackView!
    @IBOutlet weak var stackEnglish: UIStackView!
    
    private var addLoginView: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapGestureRecognizer(view: stackVietNam, ac: #selector(vietnamesePressed))
        addTapGestureRecognizer(view: stackEnglish, ac: #selector(englishPressed))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if addLoginView {
            addLoginView = false
            let viewColor = UIView()
            viewColor.backgroundColor = Constants.APP_ACCENT_COLOR
            self.view.addSubview(viewColor)
            viewColor.frame = view.bounds
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Constants.OPEN_LOGIN_WHEN_SELECT_LAGUAGE_VC_DID_APPEAR {
            Constants.OPEN_LOGIN_WHEN_SELECT_LAGUAGE_VC_DID_APPEAR = false
            present(UINavigationController(rootViewController: LoginViewController()), animated: false, completion: nil)
        }
    }

    func vietnamesePressed() {
        changeLanguage(language: "vi")
    }
    
    func englishPressed() {
        changeLanguage(language: "en")
    }
    
    func changeLanguage(language: String) {
        addLoginView = true
        Constants.CURRENT_LANGUAGE = language
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        openViewController(viewController: UINavigationController(rootViewController: LoginViewController()))
        AppUserData.setValue(key: AppUserData.KEY_LANGUAGE, value: language)
    }

}
