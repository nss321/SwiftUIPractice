//
//  ImageView.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/15/25.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    mockImageCells
                } header: {
                    HeaderView(title: "첫번째 섹션")
                }
                .listSectionSeparator(.hidden)
                
                Section {
                    mockImageCells
                } header: {
                    HeaderView(title: "두번째 섹션")
                }
                
                Section {
                    mockImageCells
                } header: {
                    HeaderView(title: "세번째 섹션")
                }
                Section {
                    mockImageCells
                } header: {
                    HeaderView(title: "네번째 섹션")
                }
            }
            .listStyle(.plain)
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("My Random Image")
    }
    
    var mockImageCells: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach((1...10), id: \.self) { _ in
                    ImageCell()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .scrollIndicators(.hidden)
        .listRowSeparator(.hidden)
    }
}

struct HeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundStyle(.black)
            .font(.title3)
    }
}


#Preview {
    ImageView()
}
