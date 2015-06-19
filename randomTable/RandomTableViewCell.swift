//
//  RandomTableViewCell.swift
//  randomTable
//
//  Created by Aizawa Takashi on 2015/06/19.
//  Copyright (c) 2015年 Aizawa Takashi. All rights reserved.
//

import UIKit

class RandomTableViewCell: UITableViewCell {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var count: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
