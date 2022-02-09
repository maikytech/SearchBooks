//
//  BookDetailViewController.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 8/02/22.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var urlBookLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    //MARK: - Variables
    var tittle: String?
    var subtitle: String?
    var isbn13: String?
    var price: String?
    var url: String?
    var image: String?
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    //MARK:- Private Methods
    private func setupView() {
        titleLabel.text = tittle
        subtitleLabel.text = subtitle
        isbnLabel.text = isbn13
        urlBookLabel.text = url
        priceLabel.text = price
        
    }
    

    

}
