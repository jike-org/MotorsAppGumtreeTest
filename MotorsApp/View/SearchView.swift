//
//  SearchView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var carsListVM = CarsViewModel()
    
    // Alert related objects
    @State var showingAlert: Bool = false
    @State var alertText: String = ""
    @State var alertDescription: String = ""
    
    @State var selection: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderComponent().padding(15)
                Spacer()
                HStack{
                    
                    Text("Make:").modifier(InLineTitleModifier())
                    Spacer()
                    Menu {
                        
                        Button {
                            carsListVM.make = "Ford"
                        } label: {
                            Text("Ford")
                            Image("icnFord")
                        }
                        Button {
                            carsListVM.make = "Nissan"
                        } label: {
                            Text("Nissan")
                            Image("icnNissan")
                        }
                        Button {
                            carsListVM.make = "BMW"
                        } label: {
                            Text("BMW")
                            Image("icnBMW")
                        }
                        
                    } label: {
                        Text("Select").modifier(BodyTextLinkModifier())
                    }.frame(width: 60, height: 40, alignment: .leading)
                    TextField("...or type here",
                              text: $carsListVM.make).textFieldStyle(.roundedBorder).frame(width: 200, height: 40, alignment: .trailing)
                        .modifier(CustomTextFieldModifier(text: $carsListVM.make))
                        .disableAutocorrection(true)
                }.padding(.leading, 15).padding(.trailing, 15)
                
                HStack{
                    Text("Model:").modifier(InLineTitleModifier())
                    Spacer()
                    TextField("enter model",
                              text: $carsListVM.model).textFieldStyle(.roundedBorder).frame(width: 200, height: 40, alignment: .trailing)
                        .modifier(CustomTextFieldModifier(text: $carsListVM.model))
                        .disableAutocorrection(true)
                }.padding(.leading, 15).padding(.trailing, 15)
                
                HStack {
                    Text("Year (tap to change):").modifier(InLineTitleModifier())
                    
                    Picker(selection: $carsListVM.year) {
                        ForEach(1950...2022, id: \.self) { value in
                            Text(String(value))
                                .tag(value)
                                .font(.body)
                        }
                    } label: {
                        Text(String(carsListVM.year))
                            .font(.body)
                    }
                    Spacer()
                }.padding(.leading, 15).padding(.trailing, 15)
                
                
                Spacer()
                
                Button(action: {
                    self.carsListVM.searchForCars()
                }) {
                  Text("Search")//.uppercased())
                    .modifier(ButtonModifier())
                }
                .frame(width: 200, height: 40, alignment: .center)
                .alert(isPresented: $carsListVM.showAlert) {
                    Alert(
                        title: Text("Error getting cars!"),
                        message: Text("Please check search terms and try again."),
                        dismissButton: .default(Text("OK")))
                }
                
                
                // For some reason the segues are looking a bit glitchy in the sim,
                // need to look into this further.
                NavigationLink(isActive: $carsListVM.requestSucceded) {
                    ResultsView(cars: $carsListVM.cars)
                } label: {
                    EmptyView()
                }
                
                
                Spacer()
            }
            .navigationBarTitle(Text("Search"))
        }.navigationViewStyle(.stack)
    
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
