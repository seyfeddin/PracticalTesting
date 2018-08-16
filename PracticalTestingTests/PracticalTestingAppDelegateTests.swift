//
//  PracticalTestingAppDelegateTests.swift
//  PracticalTestingTests
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import XCTest

@testable import PracticalTesting

class PracticalTestingAppDelegateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatRootControllerIsCorrect() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        XCTAssertTrue(appDelegate.window?.rootViewController is UINavigationController)

        let navController = appDelegate.window?.rootViewController as! UINavigationController

        XCTAssertTrue(navController.topViewController is PhotosViewController)

    }

    
}
