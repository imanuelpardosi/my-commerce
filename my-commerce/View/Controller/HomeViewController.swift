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
    
    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var titleProduct: UILabel!
    
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
        
        if (segue.identifier == "homeToDetail") {
            guard let productData = sender as? ProductData else { return }
            if let nextVC = segue.destination as? DetailViewController {
                nextVC.productData = productData
            }
        }
    }
}

extension HomeViewController: HomeProtocol {
    func willLoadData() {
        if homeViewModel.isDataExists == false {
            self.view.showActivityIndicator()
        }
    }
    
    func didFinishGettingData() {
        self.categoryCollectionView.reloadData()
        self.productTableView.reloadData()
        self.refreshControl.endRefreshing()
        self.view.hideActivityIndicator()
        self.searchBar.isUserInteractionEnabled = true
        
        self.titleCategory.isHidden = false
        self.titleProduct.isHidden = false
    }
    
    func failedToGetData(_ error: Failure) {
        
        Utility.showAlert(toController: self, withTitle: "Failed", withMessage: error.message)
        
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

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "homeToDetail", sender: homeViewModel.getProductForIndex(index: indexPath.row))
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        self.performSegue(withIdentifier: "goGoSearchPage", sender: self)
    }
}
