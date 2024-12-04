//
//  ShopEaseUITests.swift
//  ShopEaseUITests
//
//  Created by Janindu Dissanayake
//

import XCTest

final class ShopEaseUITests: XCTestCase {

    override func setUpWithError() throws {
       continueAfterFailure = false
       
    }

    override func tearDownWithError() throws {
       
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // MARK: Tab bar buttons tests
        
        let tabBar = app.tabBars["Tab Bar"]
           
       // Check if the "Collections" tab bar button exists
       XCTAssertNotNil(tabBar.buttons["Collections"])
       
       // Check if the "Shopping Cart" tab bar button exists
       XCTAssertNotNil(tabBar.buttons["Shopping Cart"])
       
        // Tap the "Collections" tab bar button
       tabBar.buttons["Collections"].tap()
       
       // Verify that the "Collections" tab is selected
       XCTAssertTrue(tabBar.buttons["Collections"].isSelected)
       
       // Tap the "Shopping Cart" tab bar button
       tabBar.buttons["Shopping Cart"].tap()
       
       // Verify that the "Shopping Cart" tab is selected
       XCTAssertTrue(tabBar.buttons["Shopping Cart"].isSelected)
        
        // MARK: Add to Shopping Cart Button Tests
        
       let addToCartButton = app.staticTexts["Add to Shopping Cart"]
        
       // Assert the existence of "Add to Shopping Cart" button
       XCTAssertNotNil(addToCartButton, "Add to Shopping Cart button is not found")
      
       
                 
    
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
