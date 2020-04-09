//
//  HomeScreenUITests.swift
//  my-commerceUITests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest

class HomeScreenUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func test_home_screen_component() {
        let app = XCUIApplication()

        let signInButton = app.buttons["Sign In"]
        signInButton.tap()

        let userNameTextField = app.searchFields["What do you want to buy?"]
        XCTAssertTrue(userNameTextField.exists)
        
        let inProgressActivityIndicator = app.activityIndicators["In progress"]
        
        while inProgressActivityIndicator.exists {
            sleep(1)
        }
        
        let elementsQuery = app.scrollViews.otherElements
        let categoryLabel = elementsQuery.staticTexts["Popular Categories"]
        let promoLabel = elementsQuery.staticTexts["Ongoing Promos"]
        let loveImage = app/*@START_MENU_TOKEN@*/.images["ic_love"]/*[[".otherElements[\"D267875D-8202-4A84-91E2-3ED6E816946E\"].images[\"ic_love\"]",".images[\"ic_love\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertTrue(categoryLabel.exists)
        XCTAssertTrue(promoLabel.exists)
        XCTAssertTrue(loveImage.exists)

        /*
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: categoryLabel, handler: nil)
        expectation(for: exists, evaluatedWith: promoLabel, handler: nil)
        expectation(for: exists, evaluatedWith: loveImage, handler: nil)

        waitForExpectations(timeout: 5, handler: nil)
        */
    }
    
    override func tearDown() {
        super.tearDown()
           
    }
}
