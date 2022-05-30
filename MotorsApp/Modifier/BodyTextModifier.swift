//
//  BodyTextModifier.swift
//  MotorsApp
//
//  Created by Stephen Clark on 30/05/2022.
//

import Foundation

import SwiftUI

struct BodyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font(UIFont.Light.size1))
            .foregroundColor(Color(uiColor: UIColor.darkGray))
    }
}

struct BodyTextLinkModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font(UIFont.Light.size1))
            .foregroundColor(.blue)
    }
}

struct InLineTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font(UIFont.Bold.size0))
            .foregroundColor(.black)
    }
}
