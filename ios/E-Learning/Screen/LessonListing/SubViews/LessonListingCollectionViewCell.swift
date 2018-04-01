//
//  LessonListingCollectionViewCell.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit

class LessonListingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgLesson: UIImageView!
    @IBOutlet weak var lblLesson: UILabel!
    @IBOutlet weak var dimView: UIView!
    
    
    var lesson: Lesson! {
        didSet {
            lblLesson.text = lesson.name
            let image = "\(URLConfig.share.mediaBaseURL)\(lesson.image)"
            imgLesson.sd_setImage(with: URL(string: image))
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            dimView.backgroundColor = isHighlighted ? UIColor.lightGray.withAlphaComponent(0.1) : UIColor.clear
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dimView.backgroundColor = UIColor.clear
    }

}
