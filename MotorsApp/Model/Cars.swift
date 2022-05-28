//
//  Cars.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import Foundation

// MARK: - Cars
struct Cars: Codable, Hashable {
    let searchResults: [SearchResult]
}

// MARK: - SearchResult
struct SearchResult: Codable, Hashable {
    let id, name, title, make: String
    let model, year, price: String
}
