//
//  BrastlewarkCreatureNPCUITests.swift
//  BrastlewarkCreatureNPCUITests
//
//  Created by  Jose  Santiago on 5/23/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import XCTest

class BrastlewarkCreatureNPCUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let cell = app.tables.firstMatch.cells.firstMatch
        let smallCellSize = cell.frame.size.height
        cell.tap()
        let bigCellSize = cell.frame.size.height
        cell.tap()
        let smallOnceAgain = cell.frame.size.height
        XCTAssertEqual(smallCellSize, smallOnceAgain)
        XCTAssertTrue(bigCellSize > smallCellSize)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
