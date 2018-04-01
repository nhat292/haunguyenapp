//
//  LessonCategoryTableViewCell.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/14/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import UIKit

class LessonCategoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgArrowRight: UIImageView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    
    var lessonCategory: LessonCategory! {
        didSet {
            lblTitle.text = lessonCategory.name
            lblSubTitle.attributedText = lessonCategory.description.attributedStringFromHtml
            lblCount.text = "\(lessonCategory.totalLesson)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgArrowRight.image = imgArrowRight.image?.withRenderingMode(.alwaysTemplate)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
