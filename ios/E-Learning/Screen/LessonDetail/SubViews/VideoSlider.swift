//
//  VideoSlider.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/19/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit

@IBDesignable
class VideoSlider: UISlider {
    
    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(thumbImage, for: .normal)
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setThumbImage(thumbHighlightedImage, for: .highlighted)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
