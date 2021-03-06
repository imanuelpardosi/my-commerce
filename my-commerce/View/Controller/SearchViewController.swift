//
//  SearchViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    internal var productData = [ProductData]()
    let searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        
        let productCell = UINib(nibName: "ProductWithSmallIconCell", bundle: nil)
        searchTableView?.register(productCell, forCellReuseIdentifier: "productWithSmallIconCell")
        
        self.searchTableView.tableFooterView = UIView()
        self.hideKeyboardTappedAround()
        
        searchViewModel.assignProductData(data: productData)
        
        searchBar.setupSearchBarStyle()
        //searchBar.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func btnBackOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "searchToDetail") {
            guard let productData = sender as? ProductData else { return }
            if let nextVC = segue.destination as? DetailViewController {
                nextVC.productData = productData
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.filterProduct(searchText: searchText)
        searchTableView.reloadData()
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchViewModel.filterProduct(searchText: textField.text ?? "")
        searchTableView.reloadData()
        self.dismissKeyboard()
        
        return true
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.getNumberOfFilteredProduct()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productWithSmallIconCell", for: indexPath) as? ProductWithSmallIconCell
        cell?.configureCell(productData: searchViewModel.getFilteredProductForIndex(index: indexPath.row))
        
        return cell ?? UITableViewCell()
    }
}

extension SearchViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.dismissKeyboard()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "searchToDetail", sender: searchViewModel.getFilteredProductForIndex(index: indexPath.row))
    }
}
