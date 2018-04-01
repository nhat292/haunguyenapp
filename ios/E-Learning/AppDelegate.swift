//
//  AppDelegate.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import SVProgressHUD
import Toast_Swift
import IQKeyboardManagerSwift
import Material
import SideMenu
import MMPlayerView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Apply Toast message
        var style = ToastStyle()
        style.titleFont = UIFont.systemFont(ofSize: 15)
        style.messageFont = UIFont.systemFont(ofSize: 14)
        ToastManager.shared.style = style
        ToastManager.shared.tapToDismissEnabled = true
        ToastManager.shared.position = .center
        ToastManager.shared.duration = 1.5
        ToastManager.shared.queueEnabled = false
        
        //Init ProgressHUD
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setRingThickness(3)
        
        //Keyboard
        IQKeyboardManager.sharedManager().enable = true
        
        //Status bar
        UIApplication.shared.statusBarStyle = .lightContent
        
        //Define left menu
        let windowRect = UIScreen.main.bounds
        SideMenuManager.menuPresentingViewControllerUserInteractionEnabled = true
        SideMenuManager.menuFadeStatusBar = false
        SideMenuManager.menuPresentMode = .menuSlideIn
        SideMenuManager.menuWidth = max(round(min((windowRect.width), (windowRect.height)) * 0.85), 240)
        SideMenuManager.menuEnableSwipeGestures = true
        let leftMenuVC = LeftMenuViewController()
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: leftMenuVC)
        menuLeftNavigationController.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        //First view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        var firstViewController: UIViewController?
        firstViewController = UINavigationController(rootViewController: LoginViewController())
        if let language = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE) as? String {
            Constants.CURRENT_LANGUAGE = language
        } else {
            firstViewController = SelectLanguageViewController()
        }
        window?.rootViewController = firstViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        if window == MMLandscapeWindow.shared {
            return .allButUpsideDown
        } else {
            return .portrait
        }
    }

}

