//
//  MenuTableViewCell.swift
//  YearlyProgress
//
//  Created by Mason Phillips on 2/2/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit
import FontAwesome_swift

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var IconLabel: UILabel!
    @IBOutlet weak var MenuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        IconLabel.font = UIFont.fontAwesome(ofSize: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
