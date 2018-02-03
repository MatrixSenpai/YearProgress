//
//  MainViewController.swift
//  YearlyProgress
//
//  Created by Mason Phillips on 2/2/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit
import M13ProgressSuite
import Neon
import Datez
import Timepiece

class MainViewController: UIViewController {

    var clockHour: UILabel!
    var clockMin: UILabel!
    
    var clockTimer: Timer! // Update clock every minute
    var dayBarTimer: Timer! // Update day bar every hour
    
    var currentDayBar: M13ProgressViewStripedBar!
    var currentDayDateLabel: UILabel!
    var currentDayProgressLabel: UILabel!
    
    var yearLabel: UILabel!
    
    var currentYearBar: M13ProgressViewStripedBar!
    var currentYearDateLabel: UILabel!
    var currentYearProgressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Set up hour label
        clockHour = UILabel()
        clockHour.font = UIFont(name: "Digitaldream", size: 22.0)
        clockHour.textAlignment = .center
        view.addSubview(clockHour)
        
        // Set up minute label
        clockMin = UILabel()
        clockMin.font = UIFont(name: "Digitaldream", size: 22.0)
        clockMin.textAlignment = .center
        view.addSubview(clockMin)
        
        // Set up current day elements
        currentDayBar = M13ProgressViewStripedBar()
        currentDayDateLabel = UILabel()
        currentDayProgressLabel = UILabel()
        currentDayProgressLabel.textAlignment = .right
        view.addSubview(currentDayBar)
        view.addSubview(currentDayDateLabel)
        view.addSubview(currentDayProgressLabel)
        
        // Set up "Year Progress" label
        yearLabel = UILabel()
        yearLabel.textAlignment = .center
        view.addSubview(yearLabel)
        
        // Set up current year elements
        currentYearBar = M13ProgressViewStripedBar()
        currentYearDateLabel = UILabel()
        currentYearProgressLabel = UILabel()
        view.addSubview(currentYearBar)
        view.addSubview(currentYearDateLabel)
        view.addSubview(currentYearProgressLabel)
        
        // Setup timer to update clock
        if clockTimer != nil { clockTimer.invalidate() }
        clockTimer = Timer(timeInterval: 1.0, target: self, selector: #selector(MainViewController.updateClock), userInfo: nil, repeats: true)
        RunLoop.current.add(clockTimer, forMode: .commonModes)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let now = Date()

        // Set clock text
        clockHour.text = String(format: "%02d", now.currentCalendar.components.hour)
        clockMin.text = String(format: "%02d", now.currentCalendar.components.minute)
        
        // Get hours in current day
        let tnow = Date.today()
        let hours = now.currentCalendar.components.hour
        let hper: CGFloat = CGFloat(hours) / 24.0
        
        // Set day elements text
        currentDayBar.setProgress(hper, animated: true)
        currentDayDateLabel.text = DayOfWeek.new(rawValue: tnow.weekday).description
        currentDayProgressLabel.text = String(format: "%2.2f%%", hper * 100)
        
        yearLabel.text = "Year Progress"
        
        // Calculate remaining days
        let days = getDaysPast()
        let dper = CGFloat(days) / (isLeap(year: now.year) ? 366 : 365)
        
        // Set year elements text
        currentYearBar.setProgress(dper, animated: true)
        currentYearDateLabel.text = tnow.dateString(in: .medium)
        currentYearProgressLabel.text = String(format: "%2.2f%%", dper * 100)
    }
    
    override func viewDidLayoutSubviews() {
        // Position clock
        clockHour.anchorInCorner(.topLeft, xPad: 100, yPad: 90, width: 70, height: 70)
        clockMin.anchorInCorner(.topRight, xPad: 100, yPad: 90, width: 70, height: 70)
        
        // Position CurrentDay elements
        currentDayBar.anchorAndFillEdge(.top, xPad: 30, yPad: 160, otherSize: 20)
        currentDayDateLabel.align(.underMatchingLeft, relativeTo: currentDayBar, padding: 10, width: 150, height: 25)
        currentDayProgressLabel.align(.underMatchingRight, relativeTo: currentDayBar, padding: 10, width: 70, height: 25)
        
        // Position CurrentYear elements
        yearLabel.anchorInCenter(width: 110, height: 25)
        currentYearBar.align(.underCentered, relativeTo: yearLabel, padding: 10, width: currentDayBar.width, height: 20)
        currentYearDateLabel.align(.underMatchingLeft, relativeTo: currentYearBar, padding: 10, width: 150, height: 25)
        currentYearProgressLabel.align(.underMatchingRight, relativeTo: currentYearBar, padding: 10, width: 70, height: 25)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateClock() {
        let now = Date()
        clockHour.text = String(format: "%02d", now.currentCalendar.components.hour)
        clockMin.text = String(format: "%02d", now.currentCalendar.components.minute)
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

enum DayOfWeek: Int {
    case sun = 1
    case mon = 2
    case tue = 3
    case wed = 4
    case thu = 5
    case fri = 6
    case sat = 7
    
    static func new(rawValue: Int) -> DayOfWeek {
        if rawValue > 7 { return .sun }
        return self.init(rawValue: rawValue)!
    }
    
    var description: String {
        switch self {
        case .sun: return "Sunday"
        case .mon: return "Monday"
        case .tue: return "Tuesday"
        case .wed: return "Wednesday"
        case .thu: return "Thursday"
        case .fri: return "Friday"
        case .sat: return "Saturday"
        }
    }
}
