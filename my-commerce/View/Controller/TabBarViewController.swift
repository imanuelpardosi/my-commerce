//
//  TabBarViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.openHome(sender:)), name:NSNotification.Name(rawValue: "openHome"), object: nil)
    }
    
    @objc func openHome(sender: UIButton) {
        self.selectedViewController = self.viewControllers![0]
    }
}
