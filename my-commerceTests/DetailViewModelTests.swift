//
//  DetailViewModelTests.swift
//  my-commerceTests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest
@testable import my_commerce

class DetailViewModelTests: XCTestCase {

    var detailViewModel = DetailViewModel()
    var product: ProductData!
    
    override func setUp() {
        super.setUp()
        
        product = ProductData(id: "100", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/GameCube-Set.jpg/215px-GameCube-Set.jpg", title: "Nitendo GameCube", description: "Short Description", price: "$200", loved: 1)
    }

    func tests_add_purchased_product() {
        let purchasedProductBeforeAdded = PurchasedProductCache.retrievePurchasedProduct()
        
        detailViewModel.addPurchasedProduct(product: product)
        let purchasedProductAfterAdded = PurchasedProductCache.retrievePurchasedProduct()
        
        XCTAssertEqual(purchasedProductAfterAdded.last, product)
        XCTAssertEqual(purchasedProductBeforeAdded.count + 1, purchasedProductAfterAdded.count)
    }
    
    override func tearDown() {
        super.tearDown()
        
        PurchasedProductCache.removePurchasedProduct(product: product)
    }

}
