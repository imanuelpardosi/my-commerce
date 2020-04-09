//
//  Requestable.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

typealias Handler = (Result<Data>) -> Void
typealias DefaultCallBack = (DefaultResult<Data>) -> Void
typealias CompletionHandler = (CategoryAndProductResult<[CategoryProductModel]>) -> Void
typealias ProductDataCallBack = (DefaultResult<[ProductData]>) -> Void

enum Method {
    case get
    case put
    case post
    case delete
}

enum NetworkingError: String, LocalizedError {
    case jsonError = "JSON error"
    case other
    var localizedDescription: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

extension Method {
    public init(_ rawValue: String) {
        let method = rawValue.uppercased()
        switch method {
        case "POST":
            self = .post
        case "PUT":
            self = .put
        case "DELETE":
            self = .delete
        default:
            self = .get
        }
    }
}

extension Method: CustomStringConvertible {
    public var description: String {
        switch self {
        case .get:          return "GET"
        case .post:         return "POST"
        case .put:          return "PUT"
        case .delete:       return "DELETE"
        }
    }
}

protocol Requestable { }

extension Requestable {
    func request(method: Method, url: String, params: [String: Any]? = nil, callback: @escaping Handler) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        
        if let params = params {
            request.setValue(contentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        request.httpMethod = method.description
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    callback(.failure(500))
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
                        callback(.success(data!))
                    } else {
                        callback(.failure(httpResponse.statusCode))
                    }
                } else {
                    callback(.failure(500))
                }
            }
        })
        task.resume()
    }
}
