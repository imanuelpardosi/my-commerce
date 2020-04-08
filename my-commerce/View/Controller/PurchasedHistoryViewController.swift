//
//  PurchasedHistoryViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class PurchasedHistoryViewController: UIViewController {
    
    @IBOutlet weak var purchasedProductTableView: UITableView!
    
    let purchasedHistoryViewModel = PurchasedHistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productCell = UINib(nibName: "ProductWithSmallIconCell", bundle: nil)
        purchasedProductTableView?.register(productCell, forCellReuseIdentifier: "productWithSmallIconCell")
        purchasedProductTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        purchasedProductTableView.reloadData()
    }
    
    @IBAction func btnBackOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "openHome"), object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "purchasedHistoryToDetail") {
            guard let productData = sender as? ProductData else { return }
            if let nextVC = segue.destination as? DetailViewController {
                nextVC.productData = productData
            }
        }
    }
}

extension PurchasedHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchasedHistoryViewModel.getNumberOfPurchasedProduct()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productWithSmallIconCell", for: indexPath) as? ProductWithSmallIconCell
        cell?.configureCell(productData: purchasedHistoryViewModel.getPurchasedProductForIndex(index: indexPath.row))
        
        return cell ?? UITableViewCell()
    }
}

extension PurchasedHistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "purchasedHistoryToDetail", sender: purchasedHistoryViewModel.getPurchasedProductForIndex(index: indexPath.row))
    }
}
