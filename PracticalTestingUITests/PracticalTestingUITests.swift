//
//  PracticalTestingUITests.swift
//  PracticalTestingUITests
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import XCTest

class PracticalTestingUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

//    func testThatSettingsButtonIsDisabledOnLaunch() {
//        let app = XCUIApplication()
//        XCTAssertFalse(app.navigationBars["Interesting Photos"].buttons["settingsIcon"].isEnabled)
//

    func testThatSettingsButtonIsEnabledAfterDataLoad() {
        let app = XCUIApplication()
        let rightBarButton = app.navigationBars["Interesting Photos"].buttons["settingsIcon"]
        let isEnabled = NSPredicate(format: "isEnabled == true")


        expectation(for: isEnabled, evaluatedWith: rightBarButton, handler: nil)

        waitForExpectations(timeout: 3.0) { (error) in

        }

    }

    
}
