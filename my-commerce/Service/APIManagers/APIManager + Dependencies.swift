//
//  APIManager + Dependencies.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

struct Domain {
    static let url = "https://private-4639ce-ecommerce56.apiary-mock.com"
    static let home = "/home"
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

enum contentType: String {
    case json = "application/json"
}

extension Domain {
    static func baseUrl() -> String {
        return url
    }
    
    static func homeUrl() -> String {
        return home
    }
}

enum EndPoint {
    case getCategoryAndProduct
    
    var path: String {
        switch self {
        case .getCategoryAndProduct:
            return "\(Domain.baseUrl())\(Domain.homeUrl())"
        }
    }
}
