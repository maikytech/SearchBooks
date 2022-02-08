//
//  SearchViewModel.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 7/02/22.
//

import Foundation
import UIKit

final class SearchViewModel {
    
    var activityIndicator: UIActivityIndicatorView?
    
    var refreshData = {
        () -> () in
    }
    
    var dataSource: [Book] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getLibrary(technology: String, activityIndicator: UIActivityIndicatorView) {
        NetworkingProvider.shared.fetchData(technology: technology) {(library) in
            self.dataSource = library.books
            self.activityIndicator = activityIndicator
            
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
            }
            
            print(self.dataSource)
            
        } failure: { error in
            print(error.localizedDescription)
        }
    }
}
