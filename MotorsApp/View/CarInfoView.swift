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
                // Image of the Car (placeholder)
                Image(carImageString)
                    .productImageModifier()
                   
                // Placeholder for history check status button
                HStack {
                    VStack {
                        Image("icnTrust").modifier(TrustSymbolImageModifier())
                        Spacer()
                    }
                    Spacer()
                } //: HStack 1
            }.fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Text(car.name).modifier(InLineTitleModifier())
                Spacer()
                Text(car.price).modifier(InLineTitleModifier())
            } //: HStack 2
            
            HStack {
                Text(car.year).modifier(BodyTextModifier())
                Spacer()
            } //: HStack 3
            .padding(.top, 1).padding(.bottom, 1)
            
            HStack {
                Text(car.title).modifier(BodyTextModifier())
                Spacer()
                
            } //: HStack 4
            .padding(.top, 1).padding(.bottom, 1)
            
            Divider()
        }
    }
    
}

struct CarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoView(car: SearchResult(id: "123",
                                      name: "Ford Escort",
                                      title: "A 90s classic! Great condition for it's age.",
                                      make: "Ford",
                                      model: "Escort",
                                      year: "1998",
                                      price: "£1234.56"),
                    carImageString: "carA").previewLayout(.sizeThatFits)
    }
}
