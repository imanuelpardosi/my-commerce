//
//  Enums.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

enum Failure: Error {
    case apiFailure
    case decodeFailure
    case dataAlreadyExists
    
    var message: String {
        switch self {
        case .apiFailure:
            return "Failed"
        case .decodeFailure:
            return "Something went wrong"
        case .dataAlreadyExists:
            return "Data already exists"
        }
    }
}

enum CategoryAndProductResult<Value: Decodable> {
    case success(Value)
    case failure(Failure)
}

enum Result<Value: Decodable> {
    case success(Value)
    case failure(Int)
}

enum DefaultResult<Value: Decodable> {
    case success(Value)
    case failure(Failure)
}
