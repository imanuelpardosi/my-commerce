//
//  ViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.delegate = self
        homeViewModel.fetchCategoryAndProduct()
    }
}

extension HomeViewController: HomeProtocol {
    func didFinishGettingData() {
        print("data loaded")
        print(homeViewModel.getNumberOfProduct())
    }
    
    func failedToGetData(_ error: Failure) {
        print("data failed: \(error)")
    }
}
