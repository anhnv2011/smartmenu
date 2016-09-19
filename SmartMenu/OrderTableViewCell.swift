//
//  TableViewCell.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/26/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var img_Food: UIImageView!
    var lbl_FoodName: UILabel!
    var lbl_FoodInfo: UILabel!
    var lbl_FoodPrice: UILabel!
    var lbl_Discount: UILabel!
    var lbl_DiscountValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
