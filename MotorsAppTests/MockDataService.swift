//
//  MockDataService.swift
//  MotorsAppTests
//
//  Created by Stephen Clark on 30/05/2022.
//


import Combine
import Foundation

@testable import MotorsApp

final class MockDataService: CarsFetchingService {
    func fetchCars(make: String, model: String, year: String) -> AnyPublisher<Cars, Error> {
        
        let searchResultOne = SearchResult(id: "1", name: "Car A", title: "Cool Car", make: "Tesla", model: "X", year: "2020", price: "£50000")
        let searchResultTwo = SearchResult(id: "2", name: "Car B", title: "Big Car", make: "Ford", model: "T", year: "1945", price: "£95000")

        let searchResults = [searchResultOne, searchResultTwo]
        
        let result: AnyPublisher<Cars, Error> = createResults(searchResults: searchResults)
        sleep(3)
        return result
    }
    
    
    private func createResults(searchResults: [SearchResult]) -> AnyPublisher<Cars, Error>  {
        
        let cars = Cars(searchResults: searchResults)
        
        return Just((cars))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
