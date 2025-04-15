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
                    ImageCell(id: (1...250).randomElement()!)
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
            .font(.title3)
    }
}

struct ImageCell: View {
    let id: Int
    var url: URL {
        URL(string: "https://picsum.photos/id/\(id)/100/140")!
    }
    var body: some View {
        VStack {
            AsyncImage(url: url) { data in
                switch data {
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 140)
                case .success(let image):
                    image
                        .resizable()
                case .failure(let error):
                    Image(systemName: "star")
                        .foregroundStyle(.yellow)
                        .frame(width: 100, height: 140)
                }
                
            }
        }
        .background(.purple)
        .clipShape(.rect(cornerRadius: 20))
    }
}


#Preview {
    ImageView()
}
