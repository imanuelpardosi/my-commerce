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
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: .valueChanged)
        
        return refreshControl
    }()
    
    let homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.delegate = self
        scrollView.addSubview(refreshControl)
        searchBar.setupSearchBarStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if homeViewModel.isDataExists == false {
            homeViewModel.fetchCategoryAndProduct()
            self.searchBar.isUserInteractionEnabled = false
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        homeViewModel.fetchCategoryAndProduct()
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
    func willLoadData() {
        self.view.showActivityIndicator()
    }
    
    func didFinishGettingData() {
        self.categoryCollectionView.reloadData()
        self.productTableView.reloadData()
        self.refreshControl.endRefreshing()
        self.view.hideActivityIndicator()
        self.searchBar.isUserInteractionEnabled = true
    }
    
    func failedToGetData(_ error: Failure) {
        print("data failed: \(error)")
        self.view.hideActivityIndicator()
        self.searchBar.isUserInteractionEnabled = true
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
