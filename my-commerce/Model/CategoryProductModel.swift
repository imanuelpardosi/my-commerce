//
//  CategoryProductModel.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

struct CategoryProductModel: Codable {
    var data: CategoryProductData
}

struct CategoryProductData: Codable {
    var category: CategoryData
    var product: ProductData
}

struct CategoryData: Codable {
    var id: Int
    var name: String
    var imageUrl: String
}

struct ProductData: Codable {
    var id: String
    var imageUrl: String
    var title: String
    var description: String
    var price: String
    var loved: Int
}
