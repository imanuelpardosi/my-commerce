//
//  ViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var productTableViewHeight: NSLayoutConstraint!
    
    let homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.delegate = self
        homeViewModel.fetchCategoryAndProduct()
        
        setupSearchBarStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.categoryCollectionView.reloadData()
        self.productTableView.reloadData()
    }
    
    func setupSearchBarStyle() {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
            textfield.borderStyle = .none
            textfield.font = UIFont(name: "Helvetica", size: 13)
            textfield.adjustsFontSizeToFitWidth = true
            textfield.minimumFontSize = 8
        }
        
        searchBar.layer.cornerRadius = 5
        searchBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        searchBar.layer.borderWidth = 0.5
        searchBar.clipsToBounds = true
        searchBar.placeholder = "What do you want to buy?"
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goGoSearchPage") {
            if let nextVC = segue.destination as? SearchViewController {
                nextVC.productData = homeViewModel.product
            }
        }
    }
}

extension HomeViewController: HomeProtocol {
    func didFinishGettingData() {
        self.categoryCollectionView.reloadData()
        self.productTableView.reloadData()
    }
    
    func failedToGetData(_ error: Failure) {
        print("data failed: \(error)")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.getNumberOfCategory()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell
        
        cell?.configureCell(categoryData: homeViewModel.getCategoryForIndex(index: indexPath.row))
        
        return cell ?? UICollectionViewCell()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productTableViewHeight.constant = CGFloat(homeViewModel.getNumberOfProduct() * 220)
        return homeViewModel.getNumberOfProduct()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell
        
        cell?.configureCell(productData: homeViewModel.getProductForIndex(index: indexPath.row))
         
        return cell ?? UITableViewCell()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        self.performSegue(withIdentifier: "goGoSearchPage", sender: self)
    }
}
