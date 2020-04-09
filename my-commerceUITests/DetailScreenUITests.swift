//
//  DetailScreenUITests.swift
//  my-commerceUITests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest

class DetailScreenUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func test_detail_screen_component() {
        let app = XCUIApplication()
        app.buttons["Sign In"].tap()
        
        let inProgressActivityIndicator = app.activityIndicators["In progress"]

        while inProgressActivityIndicator.exists {
            sleep(1)
        }
        
        app.scrollViews.otherElements.tables.cells.element(boundBy: 0).tap()
        
        let backButton = app/*@START_MENU_TOKEN@*/.buttons["ic back"]/*[[".otherElements[\"D267875D-8202-4A84-91E2-3ED6E816946E\"].buttons[\"ic back\"]",".buttons[\"ic back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let buyButton = app.buttons["Buy"]
        let shareButton = app.buttons["ic share"]
        let titleLabel = app.staticTexts["title"]
        let descriptionLabel = app.staticTexts["description"]
        let priceLabel = app.staticTexts["price"]
        let loveImage = app.images["ic_love"]
        
        XCTAssertTrue(backButton.exists)
        XCTAssertTrue(buyButton.exists)
        XCTAssertTrue(shareButton.exists)
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(descriptionLabel.exists)
        XCTAssertTrue(priceLabel.exists)
        XCTAssertTrue(loveImage.exists)
    }
    
    func test_buy_product() {
        let app = XCUIApplication()
        app.buttons["Sign In"].tap()
        
        let inProgressActivityIndicator = app.activityIndicators["In progress"]

        while inProgressActivityIndicator.exists {
            sleep(1)
        }
        
        app.scrollViews.otherElements.tables.cells.element(boundBy: 0).tap()
        
        app.buttons["Buy"].tap()
        
        let alert = app.alerts["Information"]
        XCTAssertTrue(alert.exists)
    }
    
    func test_share_product() {
        let app = XCUIApplication()
        app.buttons["Sign In"].tap()
        
        let inProgressActivityIndicator = app.activityIndicators["In progress"]

        while inProgressActivityIndicator.exists {
            sleep(1)
        }
        
        app.scrollViews.otherElements.tables.cells.element(boundBy: 0).tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["ic share"]/*[[".otherElements[\"D267875D-8202-4A84-91E2-3ED6E816946E\"].buttons[\"ic share\"]",".buttons[\"ic share\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let navBar = app/*@START_MENU_TOKEN@*/.navigationBars["UIActivityContentView"]/*[[".otherElements[\"ActivityListView\"].navigationBars[\"UIActivityContentView\"]",".navigationBars[\"UIActivityContentView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(navBar.exists)
    }
    
    override func tearDown() {
        super.tearDown()
           
    }
}

