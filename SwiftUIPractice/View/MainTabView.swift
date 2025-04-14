//
//  TabView.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/14/25.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .black
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house.fill") {
                HomeView()
            }


            Tab("혜택", systemImage: "wonsign.circle.fill") {
                BenefitsView()
            }
        }
        .background(.black)
        .tint(.white)
    }
}

#Preview {
    MainTabView()
}
