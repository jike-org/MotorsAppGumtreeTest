//
//  CarsDataService.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import Combine
import Foundation

final class CarsDataService: CarsFetchingService {
    
    var make: String = ""
    var model: String = ""
    var year: String = ""
    
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = Constants.API.defaultScheme
        components.host = Constants.API.defaultHost
        components.path = Constants.API.defaultPath
        // TODO: - lat and long from location service, and appid from constants / env variable for production
        components.queryItems = [URLQueryItem(name: "make", value: make),
                                 URLQueryItem(name: "model", value: model),
                                 URLQueryItem(name: "year", value: year)]
        return components
    }
    
    func fetchCars(make: String, model: String, year: String) -> AnyPublisher<Cars, Error> {
        self.make = make
        self.model = model
        self.year = year
        
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map { $0.data }
            .decode(type: Cars.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// We can use protocols to describe what our data service offers, allowing us to
// create mock objects in our unit testing which also conform to this protocol
protocol CarsFetchingService {
    func fetchCars(make: String, model: String, year: String) -> AnyPublisher<Cars, Error>
}
