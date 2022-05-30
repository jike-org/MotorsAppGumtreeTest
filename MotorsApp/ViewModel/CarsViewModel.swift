//
//  MotorsViewModel.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import Foundation
import Combine

class CarsViewModel: ObservableObject {
    
   // var subscription: Set<AnyCancellable> = []
    
    var cancellable: AnyCancellable?
    
//    @Published private (set) var cars: Cars = Cars(searchResults: [])
    @Published var cars: Cars = Cars(searchResults: [])

    @Published var make: String = String()
    @Published var model: String = String()
    @Published var year: Int = 2019
    
    @Published var requestSucceded: Bool = false
    @Published var showAlert: Bool = false

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
