//
//  CommonProtocols.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

protocol HomeProtocol: class {
    func didFinishGettingData()
    func failedToGetData(_ error: Failure)
}
