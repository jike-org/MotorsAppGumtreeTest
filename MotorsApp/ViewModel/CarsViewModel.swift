//
//  MotorsViewModel.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import Foundation
import Combine

class CarsViewModel: ObservableObject {
    
    var subscription: Set<AnyCancellable> = []
    
    var cancellable: AnyCancellable?
    
    @Published private (set) var cars: Cars = Cars(searchResults: [])
    
    @Published var make: String = String()
    @Published var model: String = String()
    @Published var year: String = String()
    

    public func searchForCars() {
        
        cancellable = CarsDataService().fetchCars(make: self.make, model: self.model, year: self.year).sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished:
               // self?.requestSucceded = true
                print("SUCCESS")
            case .failure(let error):
                print(error)
//                self?.requestSucceded = false
            }
        }, receiveValue: { [weak self] carContainer in
            guard let strongSelf = self else { return }

            strongSelf.cars = carContainer
        })
        
    }
}
