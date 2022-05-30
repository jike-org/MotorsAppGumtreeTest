//
//  ButtonModifier.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font(UIFont.Body.size3))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(UIColor.Theme.mainColor.cgColor))
            .foregroundColor(Color.white)
            .cornerRadius(2)
    }
}
