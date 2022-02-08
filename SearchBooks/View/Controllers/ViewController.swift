//
//  ViewController.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 7/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOulets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var booksTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    var viewModel = SearchViewModel()
    private let cellId: String = "BooksTableViewCell"

    //MAR: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bind()
        
        //viewModel.getLibrary()
    }
    
    //MARK: - Private Methods
    private func setupView() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        
        searchBar.delegate = self
        booksTableView.delegate = self
        booksTableView.dataSource = self
        booksTableView.backgroundColor = .red
        booksTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.booksTableView.reloadData()
            }
        }
    }

}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        let object = viewModel.dataSource[indexPath.row]
        
        if let cell = cell as? BooksTableViewCell {
            cell.bookLabel.text = object.title
        }
        
        return cell
    }
}


//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

//MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        activityIndicator.startAnimating()
            
        guard let searchText = searchBar.text else {
            return
        }
        
        if (searchText != "") {
            self.viewModel.getLibrary(technology: searchText, activityIndicator: activityIndicator)
            
        }
    }
}



