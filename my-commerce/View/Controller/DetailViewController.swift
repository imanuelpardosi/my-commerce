//
//  DetailViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgFavorite: UIImageView!
    
    internal var productData: ProductData!
    
    let detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        
        detailViewModel.delegate = self
        
        self.imgIcon.downloaded(from: productData.imageUrl)
        self.lblTitle.text = productData.title
        self.lblDescription.text = productData.description
        self.lblPrice.text = productData.price
        detailViewModel.setIconFavorite(imageView: self.imgFavorite, loved: productData.loved)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func btnBackOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBuyOnClick(_ sender: Any) {
        detailViewModel.addPurchasedProduct(product: productData)
    }
    
    @IBAction func btnShareProductOnClick(_ sender: UIButton) {
        detailViewModel.shareProduct(vc: self, productData: productData)
    }
}

extension DetailViewController: DetailProtocol {
    func didFinishBuyProduct() {
        Utility.showAlert(toController: self, withTitle: "Success", withMessage: "Added to Purchased Product")
    }
    
    func failedToBuyProduct(_ error: Failure) {
        Utility.showAlert(toController: self, withTitle: "Error", withMessage: error.message)
    }
}
