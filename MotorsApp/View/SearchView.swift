//
//  SearchView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI
import ActivityIndicatorView

struct SearchView: View {
    
    @StateObject private var carsListVM = CarsViewModel()
    
    // Alert related objects
    @State var alertText: String = ""
    @State var alertDescription: String = ""
    
    @State var showLoadingIndicator = false
    
    @State var selection: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    HeaderComponent().padding(15)
                    Spacer()
                    
                    VStack {
                    
                    HStack {
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
                    } //: HStack 1
                    .padding(.leading, 15).padding(.trailing, 15)
                    
                    HStack{
                        Text("Model:").modifier(InLineTitleModifier())
                        Spacer()
                        TextField("enter model",
                                  text: $carsListVM.model).textFieldStyle(.roundedBorder).frame(width: 200, height: 40, alignment: .trailing)
                            .modifier(CustomTextFieldModifier(text: $carsListVM.model))
                            .disableAutocorrection(true)
                    } //: HStack 2
                    .padding(.leading, 15).padding(.trailing, 15)
                    
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
                    } //: HStack 3
                    .padding(.leading, 15).padding(.trailing, 15)
                    
                    }
                    .padding()
                    .border(Color(UIColor.Theme.mainColor), width: 10.0)
                    .cornerRadius(2.0)
                    .padding(2)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showLoadingIndicator = true
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
                    }      .onChange(of: carsListVM.showAlert) { newValue in
                        if newValue {
                            showLoadingIndicator.toggle()
                        }
                    }
                    
                    // Using the technique of isActive on a navigation link
                    // for our segues (on device this is smooth)
                    NavigationLink(isActive: $carsListVM.requestSucceded) {
                        ResultsView(cars: $carsListVM.cars)
                    } label: {
                        EmptyView()
                    }.onDisappear {
                        self.showLoadingIndicator = false
                    }
                    
                    Spacer()
                } //: VStack
                
                // Using a Z Stack lets us place an activity indicator on our
                // view whilst the API is queried and prior to our results view
                // being presented.
                ActivityIndicatorView(isVisible: $showLoadingIndicator,
                                      type: .rotatingDots(count: 8))
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(Color(UIColor.Theme.mainColor))
                
              
            } //: ZStack
            .navigationBarTitle(Text("Search"))
        }.navigationViewStyle(.stack)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
