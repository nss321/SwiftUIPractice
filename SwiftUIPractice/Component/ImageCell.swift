//
//  ImageCell.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/15/25.
//

import SwiftUI

struct ImageCell: View {
    var body: some View {
        VStack {
            Image(systemName: "star")
                .foregroundStyle(.yellow)
                .frame(width: 100, height: 140)
        }
        .background(.purple)
        .clipShape(.rect(cornerRadius: 20))
    }
}
