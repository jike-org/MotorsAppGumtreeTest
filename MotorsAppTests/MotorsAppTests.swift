//
//  MotorsAppTests.swift
//  MotorsAppTests
//
//  Created by Stephen Clark on 29/05/2022.
//

import XCTest
import Combine

@testable import MotorsApp

class MotorsAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // MARK: - Decode JSON - Codable Data
    
    func test_DecodingRootCodableObject_FromJson() throws {

        // GIVEN
        guard let jsonData = readLocalFile(forName: "Motors") else { XCTFail("Can't read local json file"); return }
        // WHEN
        let carsData = try? JSONDecoder().decode(Cars.self, from: jsonData)
        // THEN
        XCTAssertTrue(carsData?.searchResults.count == 4)
        XCTAssertTrue(carsData?.searchResults[0].name == "Audi A1")
        XCTAssertTrue(carsData?.searchResults[2].price == "£8900.00")
    }
    
    // MARK: - Network
    
    func test_dataService_canFetchDataFromAPI() throws {
        
        // GIVEN
        let expectation = XCTestExpectation(description: "Get cars data from api call")
        var observer: AnyCancellable?
        let carsDataService: CarsFetchingService = CarsDataService()
        
        let make = "Audi"
        let model = "A1"
        let year = "2016"
        
        // WHEN
        observer = carsDataService.fetchCars(make: make, model: model, year: year).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                // THEN (the expectation is)
                expectation.fulfill()
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { carsContainer in

        })
        // Wait upto 5 seconds for the network call to complete sucessfully
        wait(for: [expectation], timeout: 5)
    }

    
    func test_mockDataService_canFetchData() throws {
        
        let expectation = XCTestExpectation(description: "Get cars data from mock api call")
        var observer: AnyCancellable?
        let carsMockDataService: CarsFetchingService = MockDataService()
        
        // Switch to alternate queue in order to allow thread to be paused to simulate network API response delay
        DispatchQueue.global(qos: .background).async {
            observer = carsMockDataService.fetchCars(make: "Audi", model: "A1", year: "2016").sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Success")
                    expectation.fulfill()
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { carsContainer in
                
            })
        }
        
        // Wait upto 5 seconds for the network call to complete sucessfully
        wait(for: [expectation], timeout: 5)
    }
    
    
    // MARK: - Helper Functions
    
    
    /// Helper function lets us easily read json from a local file
    /// - Parameter name: name of the json file
    /// - Returns: data from the json as Data
    private func readLocalFile(forName name: String) -> Data? {
        do { // Bundle(for: type(of: self))
            if let bundlePath = Bundle(for: type(of: self )).path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
