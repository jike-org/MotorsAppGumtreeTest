//
//  MotorsViewModel.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import Foundation
import Combine

class CarsViewModel: ObservableObject {
        
    var cancellable: AnyCancellable?
    
    @Published var cars: Cars = Cars(searchResults: [])

    @Published var make: String = String()
    @Published var model: String = String()
    @Published var year: Int = 2019
    
    @Published var requestSucceded: Bool = false
    
    // Alert parameters
    @Published var showAlert: Bool = false
//    @Published var alertText: String = ""
//    @Published var alertDecription: String = ""
    
    public func setCars(cars: Cars) {
        self.cars = cars
    }

    public func searchForCars() {
        
        cancellable = CarsDataService().fetchCars(make: self.make, model: self.model, year: String(self.year)).sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished:
                self?.requestSucceded = true
            case .failure(let error):
                print(error)
                self?.requestSucceded = false
                self?.showAlert = true
            }
        }, receiveValue: { [weak self] carContainer in
            guard let strongSelf = self else { return }
            
            strongSelf.cars = carContainer
        })
        
    }
}
