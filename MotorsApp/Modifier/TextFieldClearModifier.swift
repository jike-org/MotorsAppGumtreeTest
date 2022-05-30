//
//  TextFieldClearModifier.swift
//  MotorsApp
//
//  Created by Stephen Clark on 29/05/2022.
//

import SwiftUI

struct CustomTextFieldModifier: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .font(Font(UIFont.Body.size1))
            HStack {
                if !text.isEmpty {
                    
                    Spacer().frame(width: 150, height: 10, alignment: .leading) // Works with an assumed with, todo would be making more universal
                    Button(
                        action: { self.text = "" },
                        label: {
                            Image(systemName: "delete.left")
                                .foregroundColor(Color(UIColor.opaqueSeparator))
                        }
                    )
                    
                }
            }
        }
    }
}
