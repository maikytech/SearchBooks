//
//  Book.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 7/02/22.
//

import Foundation

struct Book: Codable {
    let title: String
    let subtitle: String
    let isbn13: String
    let price: String
    let image: String
    let url: String
}
