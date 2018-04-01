//
//  MessageDialogViewController.swift
//  Home&Home
//
//  Created by Nguyen Van Nhat on 8/3/17.
//  Copyright © 2017 TECHCOJSC. All rights reserved.
//

import UIKit

class LanguageDialogViewController: BaseViewController {
    
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTitleHeightConstraint: NSLayoutConstraint!
    
    var confirm: Confirm?
    var language: String = Constants.CURRENT_LANGUAGE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()

        applyLanguage()
    }
    
    private func applyLanguage() {
        lblTitle.text = "tXr-J0-Atc.text".localized(lang: language, tableName: String(describing: type(of: self)))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.confirm?(0, language)
    }
    
    private func initView() {
        //transparent background
        view.isOpaque = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.isHidden = true
        viewBackground.layer.cornerRadius = 5
        viewBackground.alpha = 0
        
        view.isUserInteractionEnabled = true
        addTapGestureRecognizer(view: view, ac: #selector(parentViewPressed))
    }

    
    func parentViewPressed() {
        dismissDialog(language: "")
    }
    
    func showAnimation() {
        viewBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.1)
        UIView.animate(withDuration: 0.1) {
            self.viewBackground.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.viewBackground.alpha = 1
            self.view.isHidden = false
        }
    }
    
    func dismissDialog(language: String) {
        self.language = language
        UIView.animate(withDuration: 0.1, animations: {
            self.viewBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.1)
            self.viewBackground.alpha = 0
        }) { (completed) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func vietnamesePressed(_ sender: Any) {
        dismissDialog(language: "vi")
    }
    
    @IBAction func englishPressed(_ sender: Any) {
        dismissDialog(language: "en")
    }

}
