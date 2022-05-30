//
//  CarInfoView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 29/05/2022.
//

import SwiftUI

struct CarInfoView: View {
    
    // MARK: - PROPERTIES
    var car: SearchResult
    
    var carImageString: String
    
    var body: some View {
        VStack {
            ZStack {
                Image(carImageString)
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
                    .padding(.top, 1).padding(.bottom, 1)
                
                // Placeholder for history check status button
                HStack {
                    VStack {
                        Image("icnTrust").frame(width: 40, height: 40, alignment: .center)
                            .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.65))
                            .cornerRadius(20)
                            .padding(5)
                        Spacer()
                    }
                    Spacer()
                }
            }.fixedSize(horizontal: false, vertical: true)
            HStack {
                Text(car.name).modifier(InLineTitleModifier())
                Spacer()
                Text(car.price).modifier(InLineTitleModifier())
            }
            
            HStack {
                Text(car.year).modifier(BodyTextModifier())
                Spacer()
            }.padding(.top, 1).padding(.bottom, 1)
            
            HStack {
                Text(car.title).modifier(BodyTextModifier())
                Spacer()
                
            }.padding(.top, 1).padding(.bottom, 1)
            
            Divider()
        }
    }
}

struct CarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoView(car: SearchResult(id: "123",
                                      name: "name",
                                      title: "lalala",
                                      make: "Ford",
                                      model: "Ka",
                                      year: "2022",
                                      price: "£1234.56"),
                                      carImageString: "carA")
    }
}
