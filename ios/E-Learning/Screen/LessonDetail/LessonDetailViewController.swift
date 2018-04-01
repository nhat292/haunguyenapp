//
//  LessonDetailViewController.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit
import MMPlayerView
import AVFoundation

class LessonDetailViewController: BaseViewController {
    

    @IBOutlet weak var imgRoundBackground: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var webViewLessonContent: UIWebView!
    @IBOutlet weak var videoViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var webViewLessonContraintToTop: NSLayoutConstraint!
    @IBOutlet weak var videoView: UIView!
    
    // Video Player
    var coverA = CoverA.instantiateFromNib()
    lazy var mmPlayerLayer: MMPlayerLayer = {
        let l = MMPlayerLayer()
        l.cacheType = .memory(count: 5)
        l.coverFitType = .fitToPlayerView
        l.videoGravity = AVLayerVideoGravityResize
        return l
    }()
    
    var lesson: Lesson!
    private var presenter: LessonDetailPresenter!
    fileprivate var isLandscape: Bool = false
    private var isVideoAvailable: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        presenter = LessonDetailPresenter(view: self)
        
        presenter.lessonDetail(lessonId: lesson.id)
    
    }

    override func backPressed() {
        super.backPressed()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        // Observe for the screen orientation changing
        NotificationCenter.default.addObserver(self, selector: #selector(landscapeAction), name: .UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Remove observe
        NotificationCenter.default.removeObserver(self)
        // Pause video
        mmPlayerLayer.player?.pause()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mmPlayerLayer.set(url: nil, state: nil)
    }
    
    private func setup() {
        imgRoundBackground.image = imgRoundBackground.image?.withRenderingMode(.alwaysTemplate)
        webViewLessonContent.clipsToBounds = true
        webViewLessonContent.layer.cornerRadius = 3
        webViewLessonContent.scalesPageToFit = true
        webViewLessonContent.contentMode = .scaleAspectFit
        setupContent()
    }
    
    fileprivate func setupContent() {
        lblTitle.text = lesson.name
        webViewLessonContent.loadHTMLString(lesson.content, baseURL: URL(string: URLConfig.share.mediaBaseURL))
    }
    
    // Setup for video playing
    fileprivate func setupVideo() {
        if lesson.video.isEmpty {
            videoView.isHidden = true
            isVideoAvailable = false
            
            videoViewHeightConstraint.constant = 0
            webViewLessonContraintToTop.constant = 0
            UIView.animate(withDuration: 0.5, animations: { 
                self.view.layoutIfNeeded()
            })
        } else {
            let videoUrl = URL(string: "\(URLConfig.share.mediaBaseURL)\(lesson.video.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!
            coverA.delegate = self
            mmPlayerLayer.playView = videoView
            mmPlayerLayer.replace(cover: coverA)
            mmPlayerLayer.set(url: videoUrl) { [unowned self] status in
                switch status {
                case .end:
                    print("Video Ended")
                    break
                case .pause:
                    print("Video Paused")
                    break
                case .playing:
                    print("Video Playing")
                    break
                case .ready:
                    print("Video Ready")
                    self.mmPlayerLayer.showCover(isShow: true)
                    if let duration = self.mmPlayerLayer.player?.currentItem?.asset.duration, !duration.isIndefinite {
                        self.coverA.labCurrent.text = self.coverA.convert(second: CMTimeMake(1, 100).seconds)
                        self.coverA.labTotal.text = self.coverA.convert(second: duration.seconds)
                    }
                    break
                default: break
                }
            }
            mmPlayerLayer.autoPlay = false
            mmPlayerLayer.startLoading()
            isVideoAvailable = true
        }
    }
    
    // This func called when the screen orientation has changed
    func landscapeAction() {
        if !isVideoAvailable { return }
        print("Orientation changed")
        if UIDevice.current.orientation.isLandscape {
            openFullScreen()
        } else {
            openNormalScreen()
        }
    }
}

// MARK: - API Results Callback
extension LessonDetailViewController: LessonDetailView {
    
    func showLoading() {
        showProgressHUD()
    }
    
    func hideLoading() {
        hideProgressHUD()
    }
    
    func onSuccess(object: Any?) {
        if let array = object as? [Lesson] {
            if array.count > 0 {
                lesson = array[0]
                setupContent()
            }
        }
        setupVideo()
    }
    
    func onError(message: String, object: Any?) {
        showSimpleAlert(title: "TitleError".localized(lang: Constants.CURRENT_LANGUAGE, tableName: Constants.DEFAULT_LOCALIZABLE), message: message, type: .alert)
    }
}

//MARK: - Video Delegate
extension LessonDetailViewController: VideoActionDelegate {
    
    // This func called when user click on full screen/normal screen button
    func toggleScreenRotation() {
        if isLandscape {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        } else {
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        }
    }
    
    //This func called when user click on play button and the video has ended
    func playAgain() {
        mmPlayerLayer.startLoading()
    }
    
    // Open full screen
    fileprivate func openFullScreen() {
        isLandscape = true
        coverA.btnScreenMode.setImage(UIImage(named: "normal_screen"), for: .normal)
        MMLandscapeWindow.shared.makeKey(root: FullScreenViewController(), playLayer: mmPlayerLayer) {
            
        }
    }
    
    //Open normal screen
    fileprivate func openNormalScreen() {
        MMLandscapeWindow.shared.makeDisable()
        mmPlayerLayer.playView = videoView
        isLandscape = false
        coverA.btnScreenMode.setImage(UIImage(named: "full_screen"), for: .normal)
    }
    
}
