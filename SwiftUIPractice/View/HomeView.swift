//
//  HomeView.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/15/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            stockSection
            otherMenuSection
            listSection
        }
        .frame(maxWidth: .infinity)
        .background(.black)
        
    }
    
    var stockSection: some View {
        VStack {
            HStack {
                StockMenu(name: "국내주식")
                StockMenu(name: "해외주식")
                StockMenu(name: "채권")
                StockMenu(name: "ETF")
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(Stock.mock, id: \.self) {
                        StockCell(stock: $0)
                        if $0 != Stock.mock.last! {
                            Divider()
                                .background()
                                .frame(maxHeight: 40)
                        }
                    }
                }
                .foregroundStyle(.white)
            }
        }
        .background(.navy)
    }
    
    var otherMenuSection: some View {
        HStack {
            etcMenu(name: "숨음 환급액\n찾기")
            etcMenu(name: "혜택 받는\n신용카드")
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
    }
    
    var listSection: some View {
        NavigationView {
            List {
                HomeListCell(title: "내 현금영수증")
                HomeListCell(title: "내 보험료 점검하기")
                HomeListCell(title: "더 낸 연말정산 돌려받기")
            }
            .scrollContentBackground(.hidden)
            .background(.black)
            .padding(-10)
        }
        .padding(-10)
        
    }
}

struct StockMenu: View {
    let name: String
    var body: some View {
        VStack {
            Image(systemName: "star")
            Text(name)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundStyle(.white)
        .background(.gray)
        .clipShape(.rect(cornerRadius: 12))
    }
}

struct etcMenu: View {
    let name: String
    var body: some View {
        HStack {
            Text(name)
                .padding(.leading)
            Image(systemName: "bitcoinsign.square.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(.navy)
        .clipShape(.rect(cornerRadius: 12))
    }
}

struct HomeListCell: View {
    let title: String
    var body: some View {
        NavigationLink {
            EmptyView()
        } label: {
            HStack {
                Image(systemName: "star")
                Text(title)
            }
        }
        .foregroundStyle(.white)
        .listRowBackground(Color.navy)
    }
}

#Preview {
    HomeView()
}
