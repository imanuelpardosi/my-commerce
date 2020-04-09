//
//  PurchasedHistoryUITest.swift
//  my-commerceUITests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest

class PurchasedHistoryUITest: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func test_purchased_history_screen_component() {
        
        let app = XCUIApplication()
        app.buttons["Sign In"].tap()
        
        let inProgressActivityIndicator = app.activityIndicators["In progress"]

        while inProgressActivityIndicator.exists {
            sleep(1)
        }
        
        let profileTabBar = app.tabBars.buttons["Profile"]
        profileTabBar.tap()
        
        let backButton = app/*@START_MENU_TOKEN@*/.buttons["ic back"]/*[[".otherElements[\"D267875D-8202-4A84-91E2-3ED6E816946E\"].buttons[\"ic back\"]",".buttons[\"ic back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let titleLabel = app.staticTexts["Purchase History"]
        
        XCTAssertTrue(backButton.exists)
        XCTAssertTrue(titleLabel.exists)
    }
    
    override func tearDown() {
        super.tearDown()
           
    }
}
