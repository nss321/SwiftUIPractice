//
//  UpbitView.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/16/25.
//

import SwiftUI

struct UpbitView: View {
    @State var coin: Markets = []
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    coinGrid
                        .padding()
                    Divider()
                        .background(.purple)
                    coinList
                }
            }
            .customLinearGradientBackground()
        }
        .task {
            do {
                let market = try await NetworkService.shared.callRequest(api: .allMarkets, type: [Market].self)
                coin = Array(market.prefix(20))
            } catch APIError.invalidResponse {
                coin = []
                print("유효하지 않은 응답입니다.")
            } catch APIError.decodingError {
                coin = []
                print("디코딩 오류입니다.")
            } catch {
                print("알 수 없는 오류가 발생했습니다.")
            }
            
        }
    }
    
    var coinList: some View {
        LazyVStack {
            ForEach($coin, id: \.id) { $item in
                NavigationLink {
                    CoinDetailView(item: $item)
                } label: {
                    CoinRowView(coin: $item)
                        .padding(.horizontal, 20)
                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .isHidden(item == coin.last)
                    .padding(.horizontal, 100)
            }
        }
    }
    
    var coinGrid: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach($coin, id: \.id) { $item in
                NavigationLink {
                    CoinDetailView(item: $item)
                } label: {
                    CoinCellView(coin: $item)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct CoinDetailView: View {
    @Binding var item: Market
    
    var body: some View {
        VStack(alignment: .trailing) {
            header
            
            Spacer()
            
            symbol
        }
        .frame(maxHeight: .infinity)
        .padding()
        .customLinearGradientBackground()
    }
    
    var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(item.koreanName)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.primary)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
                
                Text(item.englishName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .shadow(color: .black.opacity(0.05), radius: 1, x: 1, y: 1)
            }
            
            Spacer()
            
            Image(systemName: item.like ? "star.fill" : "star")
                .foregroundStyle(.purple)
                .scaleEffect(1.5)
                .padding(8)
                .shadowedBackground(cornerRadius: 200, shadowOpacity: 0.2)
                .wrapToButton(action: item.like.toggle())
        }
        .padding()
        .shadowedBackground(cornerRadius: 10, shadowOpacity: 0.2)
        .padding(.horizontal)
    }

    var symbol: some View {
        Text(item.market)
            .font(.headline)
            .foregroundStyle(.primary)
            .padding()
            .shadowedBackground(cornerRadius: 10, shadowOpacity: 0.15)
            .padding(.bottom)
    }
}

struct CoinCellView: View {
    @Binding var coin: Market
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(coin.koreanName)
                .font(.subheadline)
                .fontWeight(.bold)
                .lineLimit(1)
            
            Text(coin.englishName)
                .foregroundStyle(.secondary)
                .font(.caption2)
                .lineLimit(1)
            
            Text(coin.market)
                .font(.caption2)
                .foregroundStyle(.gray)
            
            Image(systemName: coin.like ? "star.fill" : "star")
                .wrapToButton(action: coin.like.toggle())
                .foregroundStyle(.purple)
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .customOverlay(cornerRadius: 8, width: 1, alpha: 0.5)
        .contentShape(Rectangle())
    }
}

struct CoinRowView: View {
    @Binding var coin: Market
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(coin.koreanName)
                    .fontWeight(.bold)
                
                Text(coin.englishName)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text(coin.market)
                .font(.caption2)
            
            Image(systemName: coin.like ? "star.fill" : "star")
                .wrapToButton(action: coin.like.toggle())
                .foregroundStyle(.purple)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        //        .border(.black, width: 1)
    }
}


#Preview {
    @State var dummy = Market(market: "BTC", koreanName: "비트코인", englishName: "Bitcoin", like: false)
//    CoinDetailView(item: $dummy)
    UpbitView()
    //    CoinRowView(coin: $dummy)
    
}
