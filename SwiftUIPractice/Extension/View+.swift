//
//  View+.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/16/25.
//

import SwiftUI

extension View {
    
    func customLinearGradientBackground() -> some View {
        self
            .background {
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.blue.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            }
    }
    
    func shadowedBackground(cornerRadius: CGFloat, shadowOpacity: Double) -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white.opacity(0.9))
                    .shadow(color: .black.opacity(shadowOpacity), radius: 4, x: 0, y: 2)
            )
    }
    func padding(horizontal: CGFloat, vertical: CGFloat) -> some View {
        self
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
    
    func customOverlay(cornerRadius: CGFloat, width: CGFloat, alpha: Double) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.gray.opacity(alpha), lineWidth: width)
            )
            .contentShape(Rectangle())
    }
    
    func isHidden(_ isHidden: Bool) -> some View {
        VStack {
            if isHidden {
                self.hidden()
            } else {
                self
            }
        }
    }
}
