//
//  TrustSymbolImageModifier.swift
//  MotorsApp
//
//  Created by Stephen Clark on 01/06/2022.
//

import SwiftUI
import Foundation

struct TrustSymbolImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 40, alignment: .center)
            .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.65))
            .cornerRadius(20)
            .padding(5)
    }
}
