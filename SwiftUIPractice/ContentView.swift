//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink {
                    MainTabView()
                } label: {
                    Text("TabView")
                        .padding()
                }
                
                NavigationLink {
                    ImageView()
                } label: {
                    Text("Image")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
