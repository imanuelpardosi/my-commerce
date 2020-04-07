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
        self.searchTableView.tableFooterView = UIView()
        self.hideKeyboardTappedAround()
        
        searchViewModel.product = productData
        
        setupSearchBarStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupSearchBarStyle() {
        searchBar.becomeFirstResponder()
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
            textfield.borderStyle = .none
            textfield.font = UIFont(name: "Helvetica", size: 13)
            textfield.adjustsFontSizeToFitWidth = true
            textfield.minimumFontSize = 8
        }
        searchBar.searchTextField.delegate = self
        searchBar.layer.cornerRadius = 5
        searchBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        searchBar.layer.borderWidth = 0.5
        searchBar.clipsToBounds = true
        searchBar.placeholder = "What do you want to buy?"
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
    }
    
    @IBAction func btnBackOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchCell
        cell?.configureCell(productData: searchViewModel.getFilteredProductForIndex(index: indexPath.row))
        
        return cell ?? UITableViewCell()
    }
}

extension SearchViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.dismissKeyboard()
    }
}
