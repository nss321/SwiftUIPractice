//
//  ButtonWrapper.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/16/25.
//

import SwiftUI

private struct ButtonWrapper: ViewModifier {
    let action: () -> Void
    func body(content: Content) -> some View {
        Button{
            action()
        } label: {
            content
        }
    }
}

extension View {
    func wrapToButton(action: @autoclosure @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }
}
