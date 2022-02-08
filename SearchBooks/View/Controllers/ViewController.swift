//
//  ViewController.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 7/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOulets
    
    //MARK: - Variables
    var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getLibrary()
        
    }


}

