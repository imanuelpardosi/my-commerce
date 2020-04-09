//
//  HomeViewModel.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

class HomeViewModel {
   
    weak var delegate: HomeProtocol?
    var category = [CategoryData]()
    var product = [ProductData]()
    
    private var isDataAlreadyAccessed = false
    
    var isDataExists: Bool {
        get { return isDataAlreadyAccessed }
        set (newVal) {
            isDataAlreadyAccessed = newVal
        }
    }
    
    func assignCategoryData(data: [CategoryData]) {
        self.category = data
    }
    
    func assignProductData(data: [ProductData]) {
        self.product = data
    }
    
    func fetchCategoryAndProduct() {
        let apiRequest = APIRequest()
        self.delegate?.willLoadData()
        apiRequest.fetchCategoryAndProduct { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let categoryAndProductData):
                self.assignCategoryData(data: categoryAndProductData.first?.data.category ?? [CategoryData]())
                self.assignProductData(data: categoryAndProductData.first?.data.product ?? [ProductData]())
                
                self.delegate?.didFinishGettingData()
                self.isDataAlreadyAccessed = true
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
