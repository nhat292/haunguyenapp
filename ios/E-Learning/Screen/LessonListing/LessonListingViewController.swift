//
//  LessonListingViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit

class LessonListingViewController: BaseViewController {

    
    @IBOutlet weak var imgRoundBackground: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .white
        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        let title = "Loading".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE)
        refresh.attributedTitle = NSAttributedString(string: title, attributes: attributes)
        refresh.addTarget(self, action: #selector(refreshing), for: .valueChanged)
        return refresh
    }()
    @IBOutlet weak var lblEmpty: UILabel!
    
    
    var lessonCategory: LessonCategory!
    var lessons = [Lesson]()
    let cellId = "cell"
    fileprivate var presenter: LessonListingPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        applyLanguage()
        
        presenter = LessonListingPresenter(view: self)
        
        presenter.lessons(categoryId: lessonCategory.id, showLoadingFullscreen: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.addSubview(refreshControl)
        }
    }
    
    private func setup() {
        imgRoundBackground.image = imgRoundBackground.image?.withRenderingMode(.alwaysTemplate)
        lblTitle.text = lessonCategory.name

        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let itemWidth: CGFloat = (collectionView.layer.frame.size.width / 2) - 15
        let itemHeight: CGFloat = itemWidth + 30
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "LessonListingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
    
    }
    
    // Apply language
    private func applyLanguage() {
        lblEmpty.text = "RHC-k6-kPF.text".localized(lang: Constants.CURRENT_LANGUAGE, tableName: String(describing: type(of: self)))
    }
    
    // Refresh collectionview
    func refreshing() {
        presenter.lessons(categoryId: lessonCategory.id, showLoadingFullscreen: false)
    }

}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension LessonListingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LessonListingCollectionViewCell
        cell.lesson = lessons[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isVip() && indexPath.item > 0 && Constants.IS_PRODUCTION { // Check VIP
            let alert = AppAlertView(title: "TitleBuyVip".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: "MessageBuyVip".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), isOkButtonLeft: false, okButtonText: "ButtonBuy".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), cancelButtonText: "ButtonCancel".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), okButtonHandler: { (alert) in
                alert.dismissAlertView()
                let profileVC = ProfileViewController()
                profileVC.fromLesson = true
                self.pushViewController(viewController: profileVC)
            }, cancelButtonHandler: { (alert) in
                alert.dismissAlertView()
                })
            alert.show()
            return
        }
        let lessonDetailVC = LessonDetailViewController()
        lessonDetailVC.lesson = lessons[indexPath.item]
        pushViewController(viewController: lessonDetailVC)
    }
}

//MARK: - API Results Callback
extension LessonListingViewController: LessonListingView {
    
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
        if let array = object as? [Lesson] {
            lessons.removeAll()
            lessons.append(contentsOf: array)
            collectionView.reloadData()
        }
        if lessons.count > 0 {
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
