//
//  MenuTableViewController.swift
//  YearlyProgress
//
//  Created by Mason Phillips on 2/2/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    let headerView: MenuTableHeaderView = MenuTableHeaderView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        tableView.tableHeaderView = headerView
        
        tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell

        cell.IconLabel.text = ((indexPath.row == 0) ? String.fontAwesomeIcon(name: .clockO) : String.fontAwesomeIcon(name: .cog))
        cell.MenuLabel.text = ((indexPath.row == 0) ? "Progress" : "Settings")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = ((indexPath.row == 0) ? MainViewController() : SettingsViewController())
        let nav = UINavigationController(rootViewController: view)
        
        mm_drawerController.setCenterView(nav, withFullCloseAnimation: true, completion: nil)
    }
}
