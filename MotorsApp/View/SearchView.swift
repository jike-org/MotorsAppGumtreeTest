//
//  SearchView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI
import SwifterSwift
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
                    Text("Be aware that the test backend system can only accept numbers and letters as input, and can't take spaces!").font(Font(UIFont.Body.size0))
                    Spacer()
                    Button(action: {
                        self.showLoadingIndicator = true
                        if (self.carsListVM.make.count > 0 && self.carsListVM.model.count > 0) {
                            if (self.carsListVM.make.isAlphabeticOrNumericOrBoth && self.carsListVM.model.isAlphabeticOrNumericOrBoth) {
                                self.carsListVM.searchForCars()
                            } else {
                                alertText = "Input Character Restrictions!"
                                alertDescription = "\nThe simple backend for this test only takes letters and numbers and is unable to accept spaces"
                                carsListVM.showAlert.toggle()
                            }
                            //self.carsListVM.searchForCars()
                        } else {
                            // Alert title "Please fill in all fields"
                            alertText = "Unknown errror getting cars!"
                            alertDescription = "\nPlease try again later or contact support."
                            carsListVM.showAlert.toggle()
                        }
                    }) {
                        Text("Search")
                            .modifier(ButtonModifier())
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    .alert(isPresented: $carsListVM.showAlert) {
                        Alert(
                            title: Text(alertText),
                            message: Text(alertDescription),
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
