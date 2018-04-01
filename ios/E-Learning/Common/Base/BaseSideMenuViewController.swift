//
//  BaseSideMenuViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation
import SideMenu

class BaseSideMenuViewController: BaseViewController {
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 23, height: 18)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppUserData.setValue(key: AppUserData.KEY_LANGUAGE_CHANGED, value: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Observe for the menu status
        NotificationCenter.default.addObserver(self, selector: #selector(self.receivedNotificationFromMenu(notification:)), name: Notification.Name("SideMenu"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Remove observe
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func receivedNotificationFromMenu(notification: Notification) {
        if let userInfo = notification.userInfo as? [String: Any] {
            let open = userInfo["Open"] as! Bool
            if open {
                self.addTapGestureRecognizer(view: view, ac: #selector(closeMenu))
            } else {
                self.view.gestureRecognizers?.removeAll()
                onMenuClose()
            }
        }
    }
    
    // This method implemented at the childs viewControllers and handle for the language changing
    func onMenuClose() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
    }
    
    func menuPressed() {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    func closeMenu() {
        SideMenuManager.menuRightNavigationController?.dismiss(animated: true, completion: nil)
    }
}
