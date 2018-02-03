//
//  YearlyProgressUITests.swift
//  YearlyProgressUITests
//
//  Created by Mason Phillips on 2/2/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import XCTest

class YearlyProgressUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
    }
    
    func testUI() {
        let button = XCUIApplication().navigationBars["YearlyProgress.MainView"].children(matching: .button).element
        button.tap()
        button.tap()
        
        XCTAssert(true, "Check")
    }
}
