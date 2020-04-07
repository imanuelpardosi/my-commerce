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
    @IBOutlet weak var scrollView: UIScrollView!
    
    let homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.delegate = self
        homeViewModel.fetchCategoryAndProduct()
        
        setupSearchBarStyle()
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
}

extension HomeViewController: HomeProtocol {
    func didFinishGettingData() {
        print("data loaded")
        print(homeViewModel.getNumberOfProduct())
    }
    
    func failedToGetData(_ error: Failure) {
        print("data failed: \(error)")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell
        
        return cell ?? UICollectionViewCell()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productTableViewHeight.constant = 20 * 153
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell
         
        return cell ?? UITableViewCell()
    }
    
    
}
