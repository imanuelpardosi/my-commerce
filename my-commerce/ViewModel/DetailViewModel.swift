//
//  DetailViewModel.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 08/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel: NSObject {
    weak var delegate: DetailProtocol?
    
}

extension DetailViewModel {
    
    func setIconFavorite(imageView: UIImageView, loved: Int) {
        if loved == 1 {
            imageView.image = UIImage(named: "ic_favorite_pink")
        } else {
            imageView.image = UIImage(named: "ic_favorite_grey")
        }
    }
    
    func addPurchasedProduct(product: ProductData) {
        PurchasedProductCache.addPurchasedProduct(product) { [weak self](result) in
            switch result {
            case .success( _):
                self?.delegate?.didFinishBuyProduct()
            case .failure(let error):
                self?.delegate?.failedToBuyProduct(error)
            }
        }
    }
    
    func shareProduct(vc: UIViewController, productData: ProductData) {
        let title = "Let's check out \(productData.title) on my-commerce now! Only \(productData.price)."
        let shareAll = [title, productData.imageUrl]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = vc.view
        vc.present(activityViewController, animated: true, completion: nil)
    }
}
