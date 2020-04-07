//
//  SearchViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
