//
//  TodayViewController.swift
//  DaWidget
//
//  Created by Mason Phillips on 2/2/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit
import NotificationCenter
import Timepiece

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet var DateLabel: UILabel!
    @IBOutlet var PercentageLabel: UILabel!
    @IBOutlet weak var Progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        let date = Date.today()
        DateLabel.text = date.dateString(in: .medium)
        
        let days = getDaysPast()
        let dper = Float(days) / (isLeap(year: date.year) ? 366 : 365)
        PercentageLabel.text = String(format: "%.2f%%", dper * 100)
        
        Progress.setProgress(dper, animated: true)
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func getDaysPast() -> Int {
        let now = Date()
        
        
        var total = 0
        
        for index in 1..<now.month {
            guard index < 12 else { break }
            switch index {
            case 2: total += (isLeap(year: now.year) ? 29 : 28)
            case 1, 3, 5, 7, 8, 10: total += 31 // Will never reach December
            default: total += 30
            }
        }
        
        total += now.day
        
        guard total <= 366 else { return 0 }
        return total
    }
    
    func isLeap(year: Int) -> Bool {
        guard (((year % 4) == 0) && ((year % 100) != 0)) ||
            ((year % 400) == 0 )
            else { return false }
        return true
    }
}
