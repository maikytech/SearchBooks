//
//  SearchViewModel.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 7/02/22.
//

import Foundation

final class SearchViewModel {
    
    var refreshData = {
        () -> () in
    }
    
    var dataSource: [Library] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getLibrary() {
        NetworkingProvider.shared.fetchData(technology: "ios") {(library) in
            self.dataSource.append(library)
            print(self.dataSource[0].books[0].title)
            
        } failure: { error in
            print(error.localizedDescription)
        }
    }
}
