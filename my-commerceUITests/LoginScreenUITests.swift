//
//  LoginScreenUITests.swift
//  my-commerceUITests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest

class LoginScreenUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func test_login() {
        let app = XCUIApplication()
        
        let userNameTextField = app.textFields["Username"]
        XCTAssertTrue(userNameTextField.exists)

        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)

        let signInButton = app.buttons["Sign In"]
        XCTAssertTrue(signInButton.exists)
        
        let signInWithGoogleButton = app.buttons["Sign in with Google"]
        XCTAssertTrue(signInWithGoogleButton.exists)
        
        let signInWithFacebookButton = app.buttons["Sign in with Facebook"]
        XCTAssertTrue(signInWithFacebookButton.exists)
        
        signInButton.tap()
    }
    
    override func tearDown() {
        super.tearDown()
    }


}
