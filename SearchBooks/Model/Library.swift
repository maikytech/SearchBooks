//
//  Library.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 7/02/22.
//

import Foundation

struct Library: Codable {
    let error: String
    let total: String
    let page: String
    let books: [Book]
}
