//
//  APIRequest.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class APIRequest: NSObject, Requestable {
    func fetchCategoryAndProduct(callback: @escaping CompletionHandler) {
        let url = EndPoint.getCategoryAndProduct.path
        
        self.callAPIToGetData(url: url) { (data) in
            switch data {
            case .success(let categoryAndProductData):
                do {
                    let decoder = JSONDecoder()
                    let categoryAndProduct = try decoder.decode([CategoryProductModel].self, from: categoryAndProductData)
                    print("categoryAndProduct: \(categoryAndProduct)")
                    callback(.success(categoryAndProduct))
                } catch {
                    callback(.failure(.decodeFailure))
                }
            case .failure(_):
                callback(.failure(.apiFailure))
            }
        }
    }
}

extension APIRequest {
    private func callAPIToGetData(url: String, callback: @escaping DefaultCallBack) {
        request(method: .get, url: url, params: nil) { (data) in
            switch data {
            case .success(let result):
                callback(.success(result))
            case .failure(_):
                callback(.failure((.apiFailure)))
            }
        }
    }
}
