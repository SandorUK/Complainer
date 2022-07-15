//
//  ComplainerUITests.swift
//  ComplainerUITests
//
//  Created by Sandor Kolotenko on 23/06/2022.
//

import XCTest

class ComplainerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClaim_FlightCancelled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = ["mockFlightAPI"]
        
        // Start
        app.launch()
        app.buttons["Start"].tap()
        app.screenshot()
        
        // What happened?
        app.tables.cells["My flight was cancelled"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        app.screenshot()
        
        // Time of flight?
        app.datePickers["Time"].collectionViews.buttons.otherElements.containing(.staticText, identifier:"9").element.tap()
        app.buttons["Next"].tap()
        app.screenshot()
        
        // Origin
        app.tables["originTable"].cells.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        app.screenshot()
        
        // Destination
        app.tables["destinationTable"].cells.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        app.screenshot()
        
        // Flight
        app.tables["flightTable"].cells.containing(.staticText, identifier: "GOT").firstMatch.tap()
        app.screenshot()
        
        // User Details
        app.screenshot()
        app.textFields["First name"].tap()
        app.textFields["First name"].typeText("Obi Wan")
        
        //FIXME: Sorry, need more time to fix the keyboard dismissal here! :)
        //        app.keyboards.firstMatch.buttons["Done"].tap()
        //        app.textFields["Last name"].tap()
        //        app.textFields["Last name"].typeText("Kenobi")
        //        app.keyboards.firstMatch.buttons["Done"].tap()
        //        app.textFields["Booking Reference"].tap()
        //        app.textFields["Booking Reference"].typeText("MILLEAGLE01")
        //        app.keyboards.firstMatch.buttons["Done"].tap()
        //        app.screenshot()
        //        app.buttons["Next"].tap()
        //
        //        // User Contact Details
        //        app.screenshot()
        //        app.textFields["Email"].tap()
        //        app.textFields["Email"].typeText("obiwan@tatooine.com")
        //        app.textFields["Phone"].tap()
        //        app.textFields["Phone"].typeText("+447782569060")
        //        app.screenshot()
        //
        //        app.buttons["Complete"].tap()
        app.screenshot()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
