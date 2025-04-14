//
//  BenefitsView.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/14/25.
//

import SwiftUI

struct BenefitsView: View {
    
    var body: some View {
        VStack {
            list
        }
        .background(.black)
    }
    
    var ad: some View {
        HStack {
            Image(systemName: "star")
            VStack(alignment: .leading) {
                Text("[70,000원] 가입 지원금")
                Text("빗썸 가입하고 미수령 지원금 받기 · AD")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
        }
        .foregroundStyle(.white)
        .listRowBackground(Color.navy)
        
    }
    
    var list: some View {
        List {
            Section {
                ad
            }
            .listSectionSpacing(10)
        
            Section {
                ForEach(Menu.mockData, id: \.self) { item in
                    ListItem(icon: item.icon, title: item.title, subtitle: item.subtitle, noti: item.noti)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .listRowSeparator(.hidden)
        .background(.black)
        .padding(-10)
    }
}

struct ListItem: View {
    let icon: String
    let title: String
    let subtitle: String
    let noti: String?
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .padding(.leading, 20)
            
            VStack(alignment: .leading) {
                Text(title)
                Text(subtitle)
                    .font(.callout)
                    .foregroundStyle(.blue)
            }
            
            Spacer()
            
            if let noti {
                Text(noti)
                    .padding(4)
                    .background(.darkGray)
                    .font(.caption2)
                    .clipShape(.capsule)
                    .padding(.trailing, 10)
            }
        }
        .padding(8)
        .foregroundStyle(.white)
        .background(.navy)
        .listRowBackground(Color.black)
    }
}


#Preview {
    BenefitsView()
}
