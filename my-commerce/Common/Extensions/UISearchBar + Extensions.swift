//
//  UISearchBar + Extensions.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    func setupSearchBarStyle() {
        if let textfield = self.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
            textfield.borderStyle = .none
            textfield.font = UIFont(name: "Helvetica", size: 13)
            textfield.adjustsFontSizeToFitWidth = true
            textfield.minimumFontSize = 8
        }
        
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
        self.placeholder = "What do you want to buy?"
        self.backgroundImage = UIImage()
        self.searchTextPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
    }
}
