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

        let app = XCUIApplication()
        setupSnapshot(app)
        
        continueAfterFailure = false

        app.launch()        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func getSnapshots() {
        
    }
    
    func testUI() {
        let button = XCUIApplication().navigationBars["YearlyProgress.MainView"].children(matching: .button).element
        button.tap()
        button.tap()
        
        XCTAssert(true, "Check")
    }
}
