//
//  TreeTableViewCell.swift
//  RATreeViewExamples
//
//  Created by Rafal Augustyniak on 22/11/15.
//  Copyright © 2015 com.Augustyniak. All rights reserved.
//

import UIKit

class TreeTableViewCell : UITableViewCell {

    @IBOutlet fileprivate weak var detailsLabel: UILabel!
    @IBOutlet fileprivate weak var customTitleLabel: UILabel!

    
    override func awakeFromNib() {
        selectedBackgroundView? = UIView.init()
        selectedBackgroundView?.backgroundColor = UIColor.clear
    }

    var additionButtonActionBlock : ((TreeTableViewCell) -> Void)?;

   
    func setup(withTitle title: String, detailsText: String, level : Int, additionalButtonHidden: Bool) {
        customTitleLabel.text = title
        detailsLabel.text = detailsText

        if level == 0 {
            self.backgroundColor? = UIColor.init(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        } else if level == 1 {
            self.backgroundColor? = UIColor.init(red: 209.0/255.0, green: 238.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        } else {
            self.backgroundColor? = UIColor.init(red: 224.0/255.0, green: 248.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        }

        let left = 11.0 + 20.0 * CGFloat(level)
        self.customTitleLabel.frame.origin.x = left
        self.detailsLabel.frame.origin.x = left
    }

    

}
