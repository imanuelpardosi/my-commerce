//
//  PurchasedHistoryViewModel.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 08/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

class PurchasedHistoryViewModel {
    
    var purchasedProduct = [ProductData]()
    
    init() {
        purchasedProduct = PurchasedProductCache.retrievePurchasedProduct()
    }
    
}

extension PurchasedHistoryViewModel {
    func getNumberOfPurchasedProduct() -> Int {
        return purchasedProduct.count
    }
    
    func getPurchasedProductForIndex(index: Int) -> ProductData {
        return purchasedProduct[index]
    }
}
