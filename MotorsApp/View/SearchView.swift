//
//  SearchView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var carsListVM = CarsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack{
                    Text("Make:")
                    Spacer()
                    TextField("Enter make",
                              text: $carsListVM.make).textFieldStyle(.roundedBorder).frame(width: 200, height: 40, alignment: .trailing)
                }.padding(.leading, 15).padding(.trailing, 15)
                
                HStack{
                    Text("Model:")
                    Spacer()
                    TextField("Enter model",
                              text: $carsListVM.model).textFieldStyle(.roundedBorder).frame(width: 200, height: 40, alignment: .trailing)
                }.padding(.leading, 15).padding(.trailing, 15)
                
                HStack{
                    Text("Year:")
                    Spacer()
                    TextField("Enter year",
                              text: $carsListVM.year).textFieldStyle(.roundedBorder).frame(width: 200, height: 40, alignment: .trailing)
                }.padding(.leading, 15).padding(.trailing, 15)
                
                Button {
                    // do search
                    self.carsListVM.searchForCars()
                } label: {
                    ZStack {
                        Color(UIColor.Theme.mainColor)
                        Text("Search").foregroundColor(.white)
                    }.frame(width: 200, height: 40, alignment: .center)
                        .cornerRadius(10)
                }

                List(self.carsListVM.cars.searchResults, id: \.self) { car in
                    VStack {
                        HStack {
                            Text(car.name)
                            Text(car.title)
                        }
                        HStack {
                            Text(car.make)
                            Text(car.model)
                        }
                        HStack {
                            Text(car.year)
                            Text(car.price)
                        }
                    }
                }.navigationBarTitle(Text("Car Search"))
            }
        }.navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
