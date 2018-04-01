//
//  LessonCategoryListingViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import SideMenu

class LessonCategoryListingViewController: BaseSideMenuViewController {
    
    
    @IBOutlet weak var imgRoundBackground: UIImageView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.layer.cornerRadius = 5
            tableView.layer.masksToBounds = true
        }
    }
    
    
    @IBOutlet weak var viewPullDownToRefresh: UIView!
    @IBOutlet weak var lblPullDownToRefresh: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblEmpty: UILabel!
    
    lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .black
        refresh.attributedTitle = NSAttributedString(string: "Loading".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
        refresh.addTarget(self, action: #selector(refreshing), for: .valueChanged)
        return refresh
    }()
    
    let cellId = "cell"
    var lessonCategories = [LessonCategory]()
    fileprivate var presenter: LessonCategoriesPresenter!
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        applyLanguage()
        
        presenter = LessonCategoriesPresenter(view: self)
        
        presenter.loadLessonCategories(showLoadingFullscreen: true)
        
        presenter.checkVipExpireDay()
        
        if let production = AppUserData.getValue(key: AppUserData.KEY_PRODUCTION) as? Bool {
            if production {
                Constants.IS_PRODUCTION = production
            } else {
                presenter.checkProduction()
            }
        } else {
            presenter.checkProduction()
        }
    }
    
    // Check if language has changed
    override func onMenuClose() {
        if let languageChanged = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE_CHANGED) as? Bool {
            if languageChanged {
                applyLanguage()
                if timer != nil {
                    timer.invalidate()
                }
                self.viewPullDownToRefresh.isHidden = false
                timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideTextGuide), userInfo: nil, repeats: false)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if timer != nil {
            timer.invalidate()
        }
    }
    
    private func setup() {
        imgRoundBackground.image = imgRoundBackground.image?.withRenderingMode(.alwaysTemplate)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "LessonCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        viewPullDownToRefresh.layer.cornerRadius = 8
    }
    
    // Refresh TableView
    func refreshing() {
        presenter.loadLessonCategories(showLoadingFullscreen: false)
    }
    
    // Apply language
    private func applyLanguage() {
        lblTitle.text = "Vkx-eX-5pw.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        lblEmpty.text = "gcn-OO-sZc.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        lblPullDownToRefresh.text = "ARN-Ss-cIQ.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
        refreshControl.attributedTitle = NSAttributedString(string: "Loading".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE))
        
    }
    
    func hideTextGuide() {
        viewPullDownToRefresh.isHidden = true
    }
}

//MARK: - UITableViewDelegate, UITableViewdataSource
extension LessonCategoryListingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! LessonCategoryTableViewCell
        cell.lessonCategory = lessonCategories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lessonListingVC = LessonListingViewController()
        lessonListingVC.lessonCategory = lessonCategories[indexPath.row]
        pushViewController(viewController: lessonListingVC)
    }
    
}

//MARK: - API Results Callback
extension LessonCategoryListingViewController: LessonCategoryView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func hideIndicatorLoading() {
        refreshControl.endRefreshing()
    }
    
    func onSuccess(object: Any?) {
        if let array = object as? [LessonCategory] {
            lessonCategories.removeAll()
            lessonCategories.append(contentsOf: array)
            tableView.reloadData()
        }
        if lessonCategories.count > 0 {
            lblEmpty.isHidden = true
        } else {
            lblEmpty.isHidden = false
        }
    }
    
    func onError(message: String, object: Any?) {
        refreshControl.endRefreshing()
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
}
