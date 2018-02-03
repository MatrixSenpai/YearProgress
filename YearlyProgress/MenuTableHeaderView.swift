//
//  MenuTableHeaderView.swift
//  YearlyProgress
//
//  Created by Mason Phillips on 2/2/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit
import Neon

class MenuTableHeaderView: UIView {
    
    var logo: UIImageView!
    var title: UILabel!
    var buildInfo: UILabel!

    override init(frame: CGRect) {
        logo = UIImageView(image: UIImage(named: "Icon-v1"))
        title = UILabel()
        buildInfo = UILabel()
        super.init(frame: frame)
        
        backgroundColor = .white
        
        title.text = "YPv2018"
        title.textAlignment = .center
        buildInfo.text = "Build: v1.0.0-02032018-beta"
        
        addSubview(logo)
        addSubview(title)
        addSubview(buildInfo)
    }
    
    override func layoutSubviews() {
        logo.anchorInCorner(.topLeft, xPad: 10, yPad: 50, width: 100, height: 100)
        title.alignAndFillWidth(align: .toTheRightMatchingTop, relativeTo: logo, padding: 10, height: 21)
        
        buildInfo.anchorToEdge(.bottom, padding: 0, width: self.width, height: 21)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
