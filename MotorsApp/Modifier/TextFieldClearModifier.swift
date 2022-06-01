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
                .background(Color(UIColor.TextField.borderlessBackground))
                .font(Font(UIFont.Body.size1))
                .padding(3)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(UIColor.TextField.borderColor), lineWidth: 2))
                
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

public struct PlaceholderStyleModifier: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.Font.Body.placeholder))
                .padding(.horizontal, 5)
            }
            content
                .foregroundColor(Color(UIColor.Font.Body.textViewText))
            .padding(5.0)
        }
    }
}
