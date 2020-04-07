//
//  ProductCell.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgFavorite: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width:0, height: 2)
        cardView.layer.cornerRadius = 5
    }
    
    func configureCell(productData: ProductData) {
        lblName.text = productData.title
        imgIcon.downloaded(from: productData.imageUrl, contentMode: .scaleAspectFit)
    }
}
