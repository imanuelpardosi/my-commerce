//
//  SearchViewModel.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

class SearchViewModel: NSObject {
    
    var product = [ProductData]()
    var filteredData = [ProductData]()
    
    func filterProduct(searchText: String) {
        if searchText == "" {
            self.filteredData = []
        } else {
            self.filteredData = product.filter({ (data: ProductData) -> Bool in
                let title = data.title
                return (title.lowercased().contains(searchText.lowercased()))
            })
        }
    }
}

extension SearchViewModel {
    func getNumberOfFilteredProduct() -> Int {
        return filteredData.count
    }
    
    func getFilteredProductForIndex(index: Int) -> ProductData {
        return filteredData[index]
    }
}
