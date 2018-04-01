//
//  PaymentViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/19/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit

class PaymentViewController: BaseViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    weak var profileVC: ProfileViewController?
    var url: String!
    var firstTime: Bool = true
    var colorView: UIView = UIView()
    var payerID: String?
    var paymentID: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationController?.navigationBar.offTransparentNavigationBar()
    }
    
    private func setup() {
        
        automaticallyAdjustsScrollViewInsets = false
        webView.delegate = self
        
        colorView.backgroundColor = UIColor.white
        view.addSubview(colorView)
        colorView.frame = view.bounds
        
        webView.loadRequest(URLRequest(url: URL(string: url)!))
    }
    
    fileprivate func removeViewIfNeeded() {
        if colorView.isDescendant(of: view) {
            colorView.removeFromSuperview()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //Send payerId and paymentId to profile view controller and process payment
        if let payerID = self.payerID {
            profileVC?.processPayment(payerID: payerID, paymentID: paymentID!)
        }
    }

}

//MARK: - UIWebView Delegate
extension PaymentViewController: UIWebViewDelegate {
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //Check payerID and PaymentID
        if let url = request.url {
            if let payerID = url["PayerID"] {
                self.paymentID = url["paymentId"]!
                self.payerID = payerID
                print("PayerID: \(payerID), PaymentID: \(self.paymentID)")
                backPressed()
            }
        }
        return true
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        if firstTime {
            showProgressHUD()
        }
        
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        firstTime = false
        hideProgressHUD()
        removeViewIfNeeded()
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        firstTime = false
        hideProgressHUD()
        removeViewIfNeeded()
    }
}
