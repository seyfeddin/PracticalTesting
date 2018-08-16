//
//  PracticalTestingPhotoCellTests.swift
//  PracticalTestingTests
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import XCTest
import ObjectMapper
import UIKit

@testable import PracticalTesting

class PracticalTestingPhotoCellTests: XCTestCase {

    let photosController: PhotosViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
    }()

    let photo = Photo(JSON: [
        "width_h" : "1600",
        "datetaken" : "2018-01-03 15:22:58",
        "url_h" : "https://farm5.staticflickr.com/4675/25994584948_888d6d0dc1_h.jpg",
        "license" : "0",
        "datetakenunknown" : "0",
        "isfamily" : 0,
        "isfriend" : 0,
        "farm" : 5,
        "id" : "25994584948",
        "server" : "4675",
        "height_h" : 1067,
        "datetakengranularity" : "0",
        "secret" : "431bd99494",
        "ispublic" : 1,
        "owner" : "126297346@N07",
        "title" : "Nyctale de Tengmalm | Domaine de Maizerets | Québec [Explore | 2018-01-24 | M01]",
        "ownername" : "sylvain.messier"
        ])!

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        super.setUp()

        photosController.loadViewIfNeeded()

        photosController.photos = [photo]
        photosController.tableView.reloadData()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testThatTableViewReturnsTheCorrectCellClass() {
        let cell = photosController.tableView(photosController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))

        XCTAssertTrue(cell is PhotoTableViewCell)
    }
    
    func testThatPhotoCellResetsStateWhenReused() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        photo.license = "4"

        let cell = photosController.tableView(photosController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PhotoTableViewCell

        cell.prepareForReuse()

        XCTAssertTrue(cell.licenseImageView.isHidden)
        
    }

    
}
