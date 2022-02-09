//
//  NetworkingProvider.swift
//  SearchBooks
//
//  Created by Maiqui Cedeño on 7/02/22.
//

import Foundation

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    func fetchData(technology: String, success: @escaping (_ library: Library) -> (), failure: @escaping (_ error: Error) -> ()) {
        let url: String = "\(EndPoint.domain)\(EndPoint.search)\(technology)"
        
        guard let objectUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: objectUrl) { data, response, error in
            guard let data = data else {
                print("data error")
                print(error.debugDescription)
                return
            }
            
            do {
                let decoder = try JSONDecoder().decode(Library.self, from: data)
                success(decoder)
                
            } catch let error {
                failure (error)
                print(error.localizedDescription)
            }
        }.resume()
    }
}
