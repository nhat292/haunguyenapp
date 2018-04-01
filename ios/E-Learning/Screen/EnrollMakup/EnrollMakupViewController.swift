//
//  EnrollMakupViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/18/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import DateTimePicker

class EnrollMakupViewController: BaseSideMenuViewController {
    
    
    @IBOutlet weak var imgRoundBackground: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var viewSelectDate: UIView!
    @IBOutlet weak var txtNote: UITextView!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var btnEnroll: UIButton! {
        didSet {
            btnEnroll.layer.cornerRadius = 5
        }
    }
    
    private var presenter: EnrollMakupPresenter!
    var timer: Timer!
    var picker: DateTimePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        applyLanguage()
        
        presenter = EnrollMakupPresenter(view: self)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if timer != nil {
            timer.invalidate()
        }
    }
    
    //Check update new language when the language was changed
    override func onMenuClose() {
        if let languageChanged = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE_CHANGED) as? Bool {
            if languageChanged {
                applyLanguage()
            }
        }
    }

    
    private func setup() {
        imgRoundBackground.image = imgRoundBackground.image?.withRenderingMode(.alwaysTemplate)
        automaticallyAdjustsScrollViewInsets = false
        txtNote.delegate = self
        addTapGestureRecognizer(view: viewSelectDate, ac: #selector(selectDatePressed))
    }

    // Submit enroll
    @IBAction func enrollPressed(_ sender: Any) {
        var time = lblDate.text!
        if time == "Ngb-Fe-0MB.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))) {
            time = ""
        }
        presenter.enroll(time: time, content: txtNote.text)
    }
    
    // Set default text
    fileprivate func resetContent() {
        lblDate.text = "Ngb-Fe-0MB.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        lblDate.textColor = 0x797979.toUIColor
        txtNote.text = ""
        lblNote.isHidden = false
    }
    
    // Show DateTimePicker
    func selectDatePressed() {
        if timer != nil {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showToDayDelay), userInfo: nil, repeats: false)
        let dateStringFormat = "dd/MM/yyyy HH:mm"
        picker = DateTimePicker.show(selected: nil, minimumDate: nil, maximumDate: nil)
        picker.is12HourFormat = true
        picker.highlightColor = Constants.APP_ACCENT_COLOR
        picker.dateFormat = dateStringFormat
        picker.cancelButtonTitle = "ButtonCancel".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        picker.todayButtonTitle = "ButtonToDay".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        picker.doneButtonTitle = "Ok"
        picker.doneButtonBackgroundColor = Constants.APP_ACCENT_COLOR
        picker.completionHandler = { date in
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = dateStringFormat
            self.lblDate.text = dateFormater.string(from: date)
            self.lblDate.textColor = UIColor.black
        }
    }
    
    // Show today on DateTimePicker
    func showToDayDelay() {
        picker.todayButton.sendActions(for: .touchUpInside)
    }
    
    // Apply language
    private func applyLanguage() {
        lblTitle.text = "VG0-k0-mNv.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        btnEnroll.setTitle("6Tk-wa-ArQ.normalTitle".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self))), for: .normal)
        lblDate.text = "Ngb-Fe-0MB.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        lblNote.text = "DTI-iF-f9c.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
    }
}

//MARK: - UITextView Delegate
extension EnrollMakupViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        showOrHidePlaceHolder()
    }
    
    private func showOrHidePlaceHolder() {
        if txtNote.text.isEmpty {
            lblNote.isHidden = false
        } else {
            lblNote.isHidden = true
        }
    }
}

//MARK: - API Results Callback
extension EnrollMakupViewController: EnrollMakupView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func onSuccess(object: Any?) {
        resetContent()
        let message = object as! String
        showSimpleAlert(title: "TitleSuccess".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
    
    func onError(message: String, object: Any?) {
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
}
