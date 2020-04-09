//
//  HomeViewModelTests.swift
//  my-commerceTests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest
@testable import my_commerce

class HomeViewModelTests: XCTestCase {
    
    var homeViewModel = HomeViewModel()
    var category = [CategoryData]()
    var product = [ProductData]()

    override func setUp() {
        super.setUp()
        
        category = [CategoryData(id: 21, name: "Baju", imageUrl: "https://img.icons8.com/bubbles/2x/t-shirt.png"), CategoryData(id: 42, name: "Celana", imageUrl: "https://img.icons8.com/flat_round/2x/long-shorts.png"), CategoryData(id: 21, name: "Baju", imageUrl: "https://img.icons8.com/bubbles/2x/t-shirt.png"), CategoryData(id: 91, name: "Tas", imageUrl: "https://img.icons8.com/cute-clipart/2x/apple-watch-apps.png")]
        
        homeViewModel.assignCategoryData(data: category)
        
        product = [ProductData(id: "6723", imageUrl: "", title: "Nitendo Switch", description: "Short Description", price: "$90", loved: 0), ProductData(id: "10000", imageUrl: "", title: "Nitendo WII", description: "Short Description", price: "$190", loved: 1)]
        
        homeViewModel.assignProductData(data: product)
    }

    func test_number_of_category() {
        XCTAssertEqual(homeViewModel.getNumberOfCategory(), category.count)
    }
    
    func test_category_for_index() {
        let indexToTest = 0
        XCTAssertEqual(homeViewModel.getCategoryForIndex(index: indexToTest), category[indexToTest])
    }
    
    func test_number_of_product() {
        XCTAssertEqual(homeViewModel.getNumberOfProduct(), product.count)
    }
    
    func test_product_for_index() {
        let indexToTest = 1
        XCTAssertEqual(homeViewModel.getProductForIndex(index: indexToTest), product[indexToTest])
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
}
