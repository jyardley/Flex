//
//  Recipe_Flex_AppUITests.swift
//  Recipe_Flex_AppUITests
//
//  Created by Jeff Yardley on 4/22/25.
//

import XCTest

class Recipe_Flex_AppUITests: XCTestCase {

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

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testRecipeText() throws {
        let app = XCUIApplication()
            app.launch()

            let recipeText = app.staticTexts["Recipe List"]
            let existence = recipeText.waitForExistence(timeout: 30)
            XCTAssertTrue(existence)
    }
    
    func testRefreshButton() throws {
        let app = XCUIApplication()
            app.launch()

        let refreshButton = app.buttons["Refresh List"]
        let existence = refreshButton.waitForExistence(timeout: 30)
        XCTAssertTrue(existence)
    }
    
    func testSpashScreen() throws {
        let app = XCUIApplication()
            app.launch()

        let jeffText = app.staticTexts["Coded by Jeff Yardley"]

            XCTAssert(jeffText.exists)
    }


}
