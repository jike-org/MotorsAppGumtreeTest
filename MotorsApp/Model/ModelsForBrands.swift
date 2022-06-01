//
//  ModelsForBrands.swift
//  MotorsApp
//
//  Created by Stephen Clark on 31/05/2022.
//

// When it comes to Car Types, ideally our back end could allow the app to quickly
// show car types by brand for quick input of the most common car types without the
// need to type the car name. The proper API would allow spaces and so the longer
// car type names would be easy and quick to select.

import Foundation

// MARK: - Results
struct ModelsForBrands: Codable {
    let carTypes: [CarType]
}

// MARK: - CarType
struct CarType: Codable {
    let brand: String
    let models: [String]
}

