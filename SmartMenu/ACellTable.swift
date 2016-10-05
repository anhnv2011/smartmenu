//
//  ACellTable.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/16/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
let kCellWidth: CGFloat = 200
let kLabelHeight: CGFloat = 50
class ACellTable: UICollectionViewCell {
    var nameLabel: UILabel!
    //var imageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        
    }
    
    override var intrinsicContentSize : CGSize {
        return CGSize(width: kCellWidth, height: kCellWidth);
    }
    
    func addSubviews() {


        self.contentView.backgroundColor = UIColor.black
        if (nameLabel == nil) {
//            nameLabel = UILabel(frame: CGRect(x: 0, y: kCellWidth, width: kCellWidth, height: kLabelHeight))
            nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

            nameLabel.textAlignment = .center
            nameLabel.textColor = UIColor.red
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFont(ofSize: 30)
            contentView.addSubview(nameLabel)
        }
    }
    

    
}
