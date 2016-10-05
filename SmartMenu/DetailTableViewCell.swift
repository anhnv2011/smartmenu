//
//  DetailTableViewCell.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 10/3/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lb_FoodName: UILabel!
    @IBOutlet weak var lb_NumberFood: UILabel!
    @IBOutlet weak var image_Status: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
