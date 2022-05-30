//
//  ResultsView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct ResultsView: View {
    @Binding var cars: Cars
   // @Environment(\.dismiss) private var dismiss
    let array = ["carA", "carB", "carC", "carD", "carE"]
    
    var body: some View {
        List(self.cars.searchResults, id: \.self) { car in
        CarInfoView(car: car, carImageString: array.randomElement()!)
        }.navigationBarTitle(Text("Car Search"))
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(cars: .constant(Cars(searchResults: [SearchResult(id: "123",
                                                            name: "Car Name",
                                                            title: "Some kind of title string.",
                                                            make: "Nissan",
                                                            model: "Micra",
                                                            year: "2021",
                                                            price: "£3000")])))
    }
}
