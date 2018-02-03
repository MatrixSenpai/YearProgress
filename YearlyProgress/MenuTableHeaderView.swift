//
//  MenuTableHeaderView.swift
//  YearlyProgress
//
//  Created by Mason Phillips on 2/2/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit

class MenuTableHeaderView: UIView {
    
    var logo: UIImageView!
    var title: UILabel!
    var buildInfo: UILabel!

    override init(frame: CGRect) {
        logo = UIImageView(image: UIImage(named: "AppIcon"))
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
