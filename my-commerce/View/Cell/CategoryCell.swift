//
//  CategoryCell.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    func configureCell(categoryData: CategoryData) {
        lblName.text = categoryData.name
        imgIcon.downloaded(from: categoryData.imageUrl)
    }
}
