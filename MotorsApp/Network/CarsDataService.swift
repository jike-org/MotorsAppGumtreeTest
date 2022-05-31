//
//  CarsDataService.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import Combine
import Foundation
import SwifterSwift

final class CarsDataService: CarsFetchingService {
    
    private var make: String = ""
    private var model: String = ""
    private var year: String = ""
    
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = Constants.API.defaultScheme
        components.host = Constants.API.defaultHost
        components.path = Constants.API.defaultPath


        // The primitive API which I have been provided is unable to accept percent encoded strings
        // hence we can either restrict the user from entering spaces or remove the spaces since
        // there is no way to actually send them up in this instance.
        
        // in this case I'm forced to use a custom filter for  instead of .urlEncoded (which percent encodes spaces)
        
        // Alternatively I catch it at form validation

        /*
        let numbersAndLettersOnly: CharacterSet = CharacterSet.decimalDigits.union(CharacterSet.letters)
        
        let makeWithOnlyCharsBackendAccepts = String(make.unicodeScalars.filter(numbersAndLettersOnly.contains))
        let modelWithOnlyCharsBackendAccepts = String(model.unicodeScalars.filter(numbersAndLettersOnly.contains))
         */
        
        components.queryItems = [URLQueryItem(name: "make", value: make), URLQueryItem(name: "model", value: model), URLQueryItem(name: "year", value: year)]
        
        return components
    }
    

    func fetchCars(make: String, model: String, year: String) -> AnyPublisher<Cars, Error> {
        self.make = make
        self.model = model
        self.year = year
        
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: Cars.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

// We can use protocols to describe what our data service offers, allowing us to
// create mock objects in our unit testing which also conform to this protocol
protocol CarsFetchingService {
    func fetchCars(make: String, model: String, year: String) -> AnyPublisher<Cars, Error>
}
