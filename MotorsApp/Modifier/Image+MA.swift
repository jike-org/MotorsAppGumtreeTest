//
//  Image+MA.swift
//  MotorsApp
//
//  Created by Stephen Clark on 01/06/2022.
//

import SwiftUI
import Foundation

extension Image {
    func productImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            .padding(.top, 1).padding(.bottom, 1)
    }
}
