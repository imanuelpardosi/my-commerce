//
//  SearchViewModelTests.swift
//  my-commerceTests
//
//  Created by Imanuel Pardosi on 09/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import XCTest
@testable import my_commerce

class SearchViewModelTests: XCTestCase {

    var searchViewModel = SearchViewModel()
    var product = [ProductData]()
    var filteredData = [ProductData]()
    
    override func setUp() {
        super.setUp()
        
        product = [ProductData(id: "6723", imageUrl: "", title: "Nitendo Switch", description: "Short Description", price: "$90", loved: 0), ProductData(id: "10000", imageUrl: "", title: "Nitendo WII", description: "Short Description", price: "$190", loved: 1)]
        
        searchViewModel.assignProductData(data: product)
    }
    
    func tests_number_of_filtered_data() {
        let filteredKeyword = "Switch"
        let numberOfFiltered = 1
        
        searchViewModel.filterProduct(searchText: filteredKeyword)
        XCTAssertEqual(searchViewModel.getNumberOfFilteredProduct(), numberOfFiltered)

        let filteredKeyword2 = "Nitendo"
        let numberOfFiltered2 = 2
        
        searchViewModel.filterProduct(searchText: filteredKeyword2)
        XCTAssertEqual(searchViewModel.getNumberOfFilteredProduct(), numberOfFiltered2)
        
    }

    override func tearDown() {
        super.tearDown()
        
    }
}
