//
//  BaseViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import SVProgressHUD
import Toast_Swift
import IQKeyboardManagerSwift

class BaseViewController: UIViewController {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        return button
    }()
    
    var dimView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.transparentNavigationBar()
        IQKeyboardManager.sharedManager().enable = true
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func backPressed() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    //MARK: - ProgressHUD
    func showProgressHUD() {
        addDimView()
        SVProgressHUD.show()
    }
    
    func showProgressHUDStatus(status: String) {
        addDimView()
        SVProgressHUD.show(withStatus: status)
    }
    
    func showProgressHUDProgress(progress: Float) {
        addDimView()
        SVProgressHUD.showProgress(progress)
    }
    
    func showProgressHUDInfo(info: String) {
        addDimView()
        SVProgressHUD.showInfo(withStatus: info)
    }
    
    func showProgressHUDError(status: String) {
        addDimView()
        SVProgressHUD.showError(withStatus: status)
    }
    
    func showProgressHUDSuccess(status: String) {
        addDimView()
        SVProgressHUD.showSuccess(withStatus: status)
    }
    
    func hideProgressHUD() {
        SVProgressHUD.dismiss()
        removeDimView()
    }
    
    func addDimView() {
        let window = UIApplication.shared.keyWindow
        if (dimView == nil) {
            dimView = UIView(frame: window!.bounds)
            dimView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
        if window != nil {
            dimView.alpha = 0
            window!.addSubview(dimView)
            UIView.animate(withDuration: 0.5) {
                self.dimView.alpha = 1
            }
        }
    }
    
    func removeDimView() {
        if (dimView != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.dimView.alpha = 0
            }, completion: { (completed) in
                self.dimView.removeFromSuperview()
            })
        }
    }
    
    //MARK: - Toast
    func showToast(message: String) {
        if let window = UIApplication.shared.keyWindow {
            window.makeToast(message)
        } else {
            self.view.makeToast(message)
        }
    }
    
    //MARK: - Simple Alert
    func showSimpleAlert(title: String?, message: String?, type: AppAlertView.AlertType) {
        let alert = AppAlertView(title: title, message: message, closeButtonText: "Ok", closeButtonHandler: { (alert) in
            alert.dismissWithDuration(0.3)
        })
        alert.show()
    }
    
    //MARK: - Simple Alert with handle
    func showSimpleAlertWithCloseHandle(title: String?, message: String?, closeButtonHandler: AppAlertView.TouchHandler?) {
        let alert = AppAlertView(title: title, message: message, closeButtonText: "Ok", closeButtonHandler: closeButtonHandler)
        alert.show()
    }
    
    //MARK: - Confirm Alert
    func showConfirmAlert(title: String?, message: String?, okButtonHandler: AppAlertView.TouchHandler?, cancelButtonHandler: AppAlertView.TouchHandler?) {
        let alert = AppAlertView(title: title, message: message, isOkButtonLeft: false, okButtonText: "Ok", cancelButtonText: "ButtonCancel".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), okButtonHandler: okButtonHandler, cancelButtonHandler: cancelButtonHandler)
        alert.show()
    }
    
    // Open ViewController
    func openViewController(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    // Push ViewController
    func pushViewController(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // Check Login Status
    func isLogged() -> Bool {
        if (AppUserData.getValue(key: AppUserData.KEY_USER) as? Dictionary<String, Any>) != nil {
            return true
        }
        return false
    }
    
    // Check VIP Status
    func isVip() -> Bool {
        if let userJson = AppUserData.getValue(key: AppUserData.KEY_USER) as? [String: Any] {
            let user = User.fromJson(json: userJson)
            Constants.VIP_DUE_DAY = user.vipDueDay
            if !Constants.VIP_DUE_DAY.isEmpty {
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "dd/MM/yyyy HH:mm"
                if let dueDay = dateFormater.date(from: Constants.VIP_DUE_DAY) {
                    let currentDay = Date()
                    if dueDay > currentDay {
                        return true
                    }
                }
            }
        }
        return false
    }

}
