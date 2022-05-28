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
    
    @Published var searchText: String = String()
    
    // MARK:- Initialiser for cars via model.
    
    init() {
        // TODO: We may not need or want debounce in the context of searching this particular API
        // due to the fact that it requires all three parameters to be present meaning we might
        // just go for a static search button when all fields are populated
        
        // TEST TEMP CODE
        
        cancellable = CarsDataService().fetchCars(make: "Nissan", model: "Somit", year: "2019").sink(receiveCompletion: { [weak self] completion in
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

        
        
        
//        $searchText
//            .debounce(for: .milliseconds(800), scheduler: RunLoop.main) // debounces the string publisher, such that it delays the process of sending request to remote server.
//            .removeDuplicates()
//            .map({ (string) -> String? in
//                if string.count < 1 {
//                    self.cars.searchResults = []
//                    return nil
//                }
//
//                return string
//            }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
//            .compactMap{ $0 } // removes the nil values so the search string does not get passed down to the publisher chain
//            .sink { (_) in
//                //
//            } receiveValue: { [self] (searchField) in
//                searchItems(searchText: searchField)
//            }.store(in: &subscription)
    }
    
    
    private func searchItems(searchText: String) {
        
        print(searchText)
        // TODO: Network call here
    }
}
