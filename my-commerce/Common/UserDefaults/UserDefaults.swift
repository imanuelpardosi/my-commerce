//
//  UserDefaults.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 08/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

struct PurchasedProductCache {
    
    static let key = "purchased_product"
    
    static func addPurchasedProduct(_ value: ProductData, callback: @escaping ProductDataCallBack) {
        var productData = [ProductData]()
        productData = self.retrievePurchasedProduct()
        
        if productData.contains(where: { $0.id == value.id }) {
            callback(.failure(.dataAlreadyExists))
        } else {
            productData.append(value)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(productData), forKey: key)
            callback(.success(productData))
        }
    }
    
    static func retrievePurchasedProduct() -> [ProductData] {
        var productData = [ProductData]()
        
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            productData = try! PropertyListDecoder().decode([ProductData].self, from: data)
            return productData
        } else {
            return productData
        }
    }
    
    static func removePurchasedProduct(product: ProductData) {
        var productData = [ProductData]()
        productData = self.retrievePurchasedProduct()
        
        print("remove")
        if let idx = productData.firstIndex(where: { $0.id == product.id }) {
            productData.remove(at: idx)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(productData), forKey: key)
            print("idx: \(idx)")
        }
    }
}
