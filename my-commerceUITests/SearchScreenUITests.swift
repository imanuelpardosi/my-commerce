//
//  SearchScreenUITests.swift
//  my-commerceUITests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest

class SearchScreenUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func test_search_screen_component() {
        let app = XCUIApplication()
        app.buttons["Sign In"].tap()
        
        let inProgressActivityIndicator = app.activityIndicators["In progress"]

        while inProgressActivityIndicator.exists {
            sleep(1)
        }
        
        let whatDoYouWantToBuySearchField = app/*@START_MENU_TOKEN@*/.searchFields["What do you want to buy?"]/*[[".otherElements[\"D267875D-8202-4A84-91E2-3ED6E816946E\"].searchFields[\"What do you want to buy?\"]",".searchFields[\"What do you want to buy?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        whatDoYouWantToBuySearchField.tap()
        
        let backButton = app/*@START_MENU_TOKEN@*/.buttons["ic back"]/*[[".otherElements[\"D267875D-8202-4A84-91E2-3ED6E816946E\"].buttons[\"ic back\"]",".buttons[\"ic back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let emptyListTable = app.tables["Empty list"]
        
        XCTAssertTrue(backButton.exists)
        XCTAssertTrue(emptyListTable.exists)
    }
    
    override func tearDown() {
        super.tearDown()
           
    }
}
