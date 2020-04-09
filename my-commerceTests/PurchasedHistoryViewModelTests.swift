//
//  PurchasedHistoryViewModelTests.swift
//  my-commerceTests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest
@testable import my_commerce

class PurchasedHistoryViewModelTests: XCTestCase {

    var purchasedHistoryViewModel = PurchasedHistoryViewModel()
    var product = [ProductData]()
    
    override func setUp() {
        super.setUp()
        
        product = [ProductData(id: "6723", imageUrl: "", title: "Nitendo Switch", description: "Short Description", price: "$90", loved: 0), ProductData(id: "10000", imageUrl: "", title: "Nitendo WII", description: "Short Description", price: "$190", loved: 1)]
        
        purchasedHistoryViewModel.purchasedProduct = product
    }

    func test_number_of_purchased_product() {
        XCTAssertEqual(purchasedHistoryViewModel.getNumberOfPurchasedProduct(), product.count)
    }
    
    func test_purchased_product_for_index() {
        let indexToTest = 1
        XCTAssertEqual(purchasedHistoryViewModel.getPurchasedProductForIndex(index: indexToTest), product[indexToTest])
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
}
