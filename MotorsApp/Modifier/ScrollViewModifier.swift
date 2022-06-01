//
//  ScrollViewModifier.swift
//  MotorsApp
//
//  Created by Stephen Clark on 01/06/2022.
//

import Foundation
import SwiftUI

struct ScrollViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
    }
}
