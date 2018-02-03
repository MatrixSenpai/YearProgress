//
//  SettingsViewController.swift
//  YearlyProgress
//
//  Created by Mason Phillips on 2/3/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit
import MMDrawerController
import Neon

class SettingsViewController: UIViewController {
    
    var leftButton: MMDrawerBarButtonItem {
        return MMDrawerBarButtonItem(target: self, action: #selector(SettingsViewController.toggleDrawer))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Settings"
        
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Coming Soon!"
        view.addSubview(label)
        label.anchorInCenter(width: label.intrinsicContentSize.width, height: label.intrinsicContentSize.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func toggleDrawer() {
        ((mm_drawerController.openSide == .none) ? mm_drawerController.open(.left, animated: true, completion: nil) : mm_drawerController.closeDrawer(animated: true, completion: nil))
    }
}
