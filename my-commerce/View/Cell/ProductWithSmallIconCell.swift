//
//  SearchCell.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class ProductWithSmallIconCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    func configureCell(productData: ProductData) {
        lblName.text = productData.title
        lblPrice.text = productData.price
        imgIcon.downloaded(from: productData.imageUrl, contentMode: .scaleAspectFit)
    }
}
