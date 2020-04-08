//
//  CommonProtocols.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

protocol HomeProtocol: class {
    func willLoadData()
    func didFinishGettingData()
    func failedToGetData(_ error: Failure)
}

protocol DetailProtocol: class {
    func didFinishBuyProduct()
    func failedToBuyProduct(_ error: Failure)
}
