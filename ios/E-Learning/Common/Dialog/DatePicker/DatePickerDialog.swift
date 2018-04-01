//
//  DatePickerDialog.swift
//  Weiken
//
//  Created by Nguyen Van Nhat on 5/22/17.
//  Copyright © 2017 INFINITY STUDIOS. All rights reserved.
//

import Foundation
import UIKit

private extension Selector {
    static let buttonTapped = #selector(DatePickerDialog.buttonTapped)
    static let deviceOrientationDidChange = #selector(DatePickerDialog.deviceOrientationDidChange)
}

public class DatePickerDialog: UIView {
    public typealias DatePickerCallback = (_ date: Date?) -> Void
    
    // MARK: - Constants
    private let kDatePickerDialogDefaultButtonHeight:       CGFloat = 50
    private let kDatePickerDialogDefaultButtonSpacerHeight: CGFloat = 1
    private let kDatePickerDialogCornerRadius:              CGFloat = 7
    private let kDatePickerDialogDoneButtonTag:             Int     = 1
    
    // MARK: - Views
    private var dialogView:   UIView!
    private var titleLabel:   UILabel!
    public var datePicker:    UIDatePicker!
    private var cancelButton: UIButton!
    private var doneButton:   UIButton!
    
    open static var positiveColor: UIColor?            = Constants.APP_ACCENT_COLOR
    open static var negativeColor: UIColor?            = 0xBDBDBD.toUIColor
    
    // MARK: - Variables
    private var defaultDate:    Date?
    private var datePickerMode: UIDatePickerMode?
    private var callback:       DatePickerCallback?
    
    // MARK: - Dialog initialization
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        setupView()
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.dialogView = createContainerView()
        
        self.dialogView!.layer.shouldRasterize = true
        self.dialogView!.layer.rasterizationScale = UIScreen.main.scale
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.dialogView!.layer.opacity = 0.5
        self.dialogView!.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        self.addSubview(self.dialogView!)
        //self.isUserInteractionEnabled = true
        //self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(close)))
    }
    
    /// Handle device orientation changes
    func deviceOrientationDidChange(notification: NSNotification) {
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let screenSize = countScreenSize()
        let dialogSize = CGSize(width: 300, height: 230 + kDatePickerDialogDefaultButtonHeight + kDatePickerDialogDefaultButtonSpacerHeight)
        dialogView.frame = CGRect(x: (screenSize.width - dialogSize.width) / 2, y: (screenSize.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height)
    }
    
    /// Create the dialog view, and animate opening the dialog
    public func show(title: String, doneButtonTitle: String = "Done", cancelButtonTitle: String = "Cancel", defaultDate: Date = Date(), minimumDate: Date? = nil, maximumDate: Date? = nil, datePickerMode: UIDatePickerMode = .date, callback: @escaping DatePickerCallback) {
        self.titleLabel.text = title
        self.doneButton.setTitle(doneButtonTitle, for: UIControlState())
        self.doneButton.setBackgroundImage(UIImage.imageWithSolidColor(DatePickerDialog.positiveColor, size: self.doneButton.frame.size), for: UIControlState())
        self.doneButton.layer.cornerRadius = AppAlertView.cornerRadius
        self.doneButton.clipsToBounds = true
        self.doneButton.setTitleColor(UIColor.white, for: UIControlState())
        self.cancelButton.setTitle(cancelButtonTitle, for: UIControlState())
        self.cancelButton.setBackgroundImage(UIImage.imageWithSolidColor(DatePickerDialog.negativeColor, size: self.cancelButton.frame.size), for: UIControlState())
        self.cancelButton.layer.cornerRadius = AppAlertView.cornerRadius
        self.cancelButton.clipsToBounds = true
        self.cancelButton.setTitleColor(UIColor.white, for: UIControlState())
        self.datePickerMode = datePickerMode
        self.callback = callback
        self.defaultDate = defaultDate
        self.datePicker.datePickerMode = self.datePickerMode ?? .date
        self.datePicker.date = self.defaultDate ?? Date()
        self.datePicker.maximumDate = maximumDate
        self.datePicker.minimumDate = minimumDate
        
        /* Add dialog to main window */
        guard let appDelegate = UIApplication.shared.delegate else { fatalError() }
        guard let window = appDelegate.window else { fatalError() }
        window?.addSubview(self)
        window?.bringSubview(toFront: self)
        window?.endEditing(true)
        
        NotificationCenter.default.addObserver(self, selector: .deviceOrientationDidChange, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        /* Anim */
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
                self.dialogView!.layer.opacity = 1
                self.dialogView!.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
        )
    }
    
    /// Dialog close animation then cleaning and removing the view from the parent
    func close() {
        NotificationCenter.default.removeObserver(self)
        
        let currentTransform = self.dialogView.layer.transform
        
        let startRotation = (self.value(forKeyPath: "layer.transform.rotation.z") as? NSNumber) as? Double ?? 0.0
        let rotation = CATransform3DMakeRotation((CGFloat)(-startRotation + M_PI * 270 / 180), 0, 0, 0)
        
        self.dialogView.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1))
        self.dialogView.layer.opacity = 1
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: [],
            animations: {
                self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.dialogView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6, 0.6, 1))
                self.dialogView.layer.opacity = 0
        }) { (finished) in
            for v in self.subviews {
                v.removeFromSuperview()
            }
            
            self.removeFromSuperview()
            self.setupView()
        }
    }
    
    /// Creates the container view here: create the dialog, then add the custom content and buttons
    private func createContainerView() -> UIView {
        let screenSize = countScreenSize()
        let dialogSize = CGSize(
            width: 300,
            height: 230
                + kDatePickerDialogDefaultButtonHeight
                + kDatePickerDialogDefaultButtonSpacerHeight)
        
        // For the black background
        self.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        
        // This is the dialog's container; we attach the custom content and the buttons to this one
        let dialogContainer = UIView(frame: CGRect(x: (screenSize.width - dialogSize.width) / 2, y: (screenSize.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height))
        
        // First, we style the dialog to match the iOS8 UIAlertView >>>
        let gradient: CAGradientLayer = CAGradientLayer(layer: self.layer)
        gradient.frame = dialogContainer.bounds
        gradient.colors = [UIColor.white.cgColor,
                           UIColor.white.cgColor,
                           UIColor.white.cgColor]
        
        let cornerRadius = kDatePickerDialogCornerRadius
        gradient.cornerRadius = cornerRadius
        dialogContainer.layer.insertSublayer(gradient, at: 0)
        
        dialogContainer.layer.cornerRadius = cornerRadius
        dialogContainer.layer.borderColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1).cgColor
        dialogContainer.layer.borderWidth = 1
        dialogContainer.layer.shadowRadius = cornerRadius + 5
        dialogContainer.layer.shadowOpacity = 0.1
        dialogContainer.layer.shadowOffset = CGSize(width: 0 - (cornerRadius + 5) / 2, height: 0 - (cornerRadius + 5) / 2)
        dialogContainer.layer.shadowColor = UIColor.black.cgColor
        dialogContainer.layer.shadowPath = UIBezierPath(roundedRect: dialogContainer.bounds, cornerRadius: dialogContainer.layer.cornerRadius).cgPath
        
        // There is a line above the button
        let lineView = UIView(frame: CGRect(x: 0, y: dialogContainer.bounds.size.height - kDatePickerDialogDefaultButtonHeight - kDatePickerDialogDefaultButtonSpacerHeight, width: dialogContainer.bounds.size.width, height: kDatePickerDialogDefaultButtonSpacerHeight))
        lineView.backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        dialogContainer.addSubview(lineView)
        
        //Title
        self.titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 280, height: 30))
        self.titleLabel.font = UIFont.systemFont(ofSize: Constants.FONT_SIZE_LARGE)
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = UIColor.black
        dialogContainer.addSubview(self.titleLabel)
        
        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 30, width: 0, height: 0))
        self.datePicker.autoresizingMask = .flexibleRightMargin
        self.datePicker.frame.size.width = 300
        self.datePicker.frame.size.height = 216
        
        //Localize
        if let language = AppUserData.getValue(key: AppUserData.KEY_LANGUAGE) as? String {
            self.datePicker.locale =  NSLocale.init(localeIdentifier: language) as Locale
        }
        dialogContainer.addSubview(self.datePicker)
        
        // Add the buttons
        addButtonsToView(container: dialogContainer)
        
        return dialogContainer
    }
    
    /// Add buttons to container
    private func addButtonsToView(container: UIView) {
        let buttonWidth = (container.bounds.size.width / 2) - 15
        
        self.cancelButton = UIButton(type: .custom) as UIButton
        self.cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: Constants.FONT_SIZE_LARGE)
        self.cancelButton.frame = CGRect(
            x: 10,
            y: container.bounds.size.height - kDatePickerDialogDefaultButtonHeight + 7,
            width: buttonWidth,
            height: kDatePickerDialogDefaultButtonHeight - 14
        )
        self.cancelButton.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        container.addSubview(self.cancelButton)
        
        self.doneButton = UIButton(type: .custom) as UIButton
        self.doneButton.titleLabel?.font = UIFont.systemFont(ofSize: Constants.FONT_SIZE_LARGE)
        self.doneButton.frame = CGRect(
            x: buttonWidth + 20,
            y: container.bounds.size.height - kDatePickerDialogDefaultButtonHeight + 7,
            width: buttonWidth,
            height: kDatePickerDialogDefaultButtonHeight - 14
        )
        self.doneButton.tag = kDatePickerDialogDoneButtonTag
        self.doneButton.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        container.addSubview(self.doneButton)
    }
    
    func buttonTapped(sender: UIButton!) {
        if sender.tag == kDatePickerDialogDoneButtonTag {
            self.callback?(self.datePicker.date)
        } else {
            self.callback?(nil)
        }
        
        close()
    }
    
    // MARK: - Helpers
    
    /// Count and return the screen's size
    func countScreenSize() -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        return CGSize(width: screenWidth, height: screenHeight)
    }
    
}

