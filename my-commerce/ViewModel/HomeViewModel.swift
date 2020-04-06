//
//  HomeViewModel.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

class HomeViewModel: NSObject {
    weak var delegate: HomeProtocol?
    var category = [CategoryData]()
    var product = [ProductData]()
    
    func fetchCategoryAndProduct() {
        let apiRequest = APIRequest()
        apiRequest.fetchCategoryAndProduct { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let categoryAndProductData):
                self.category = categoryAndProductData.first?.data.category ?? [CategoryData]()
                self.product = categoryAndProductData.first?.data.product ?? [ProductData]()
                self.delegate?.didFinishGettingData()
            case .failure(let error):
                self.delegate?.failedToGetData(error)
            }
        }
    }
}

extension HomeViewModel {
    func getNumberOfCategory() -> Int {
        return category.count
    }
    
    func getNumberOfProduct() -> Int {
        return product.count
    }
    
    func getCategoryForIndex(index: Int) -> CategoryData {
        return category[index]
    }
    
    func getProductForIndex(index: Int) -> ProductData {
        return product[index]
    }
}
