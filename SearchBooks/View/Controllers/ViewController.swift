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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBookDetail" {
            if let destiny = segue.destination as? BookDetailViewController {
                if let index = sender as? Int {
                    let tittle = viewModel.dataSource[index].title
                    let subtitle = viewModel.dataSource[index].subtitle
                    let isbn13 = viewModel.dataSource[index].isbn13
                    let price = viewModel.dataSource[index].price
                    let url = viewModel.dataSource[index].url
                    let image = viewModel.dataSource[index].image
                    destiny.tittle = tittle
                    destiny.subtitle = subtitle
                    destiny.isbn13 = isbn13
                    destiny.price = price
                    destiny.url = url
                    destiny.image = image
                    
                }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToBookDetail", sender: indexPath.row)
    }
    
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



