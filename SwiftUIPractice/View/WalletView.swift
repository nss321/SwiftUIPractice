//
//  WalletView.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/15/25.
//

import SwiftUI

struct WalletView: View {
    @State private var dummy = Money.mockData
    var body: some View {
        VStack {
            List {
                ForEach(dummy, id: \.id) { item in
                    NavigationLink {
                        WalletItemDetailView(item: item)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 200)
                    } label: {
                        WalletItem(item: item)
                    }
                }
            }
        }
        .navigationTitle("Sean's Wallet")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct WalletItemDetailView: View {
    let item: Money
    var body: some View {
        VStack(alignment: .trailing) {
            HStack(alignment: .bottom) {
                Text(item.product)
                    .font(.title)
                    .bold()
                Spacer()
                Text("\(item.category)")
                    .foregroundStyle(.gray)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            Divider()
                .background(Color(uiColor: .label))
                .frame(maxWidth: .infinity)
                .padding(.vertical, -10)
            
            Spacer()
            Text(item.amountFormat)
                .foregroundStyle(Color(uiColor: .label))
                .padding()
            
        }
        .frame(maxHeight: .infinity)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(uiColor: .label), lineWidth: 2)
        }
    }
}

struct WalletItem: View {
    let item: Money
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.product)
                    .font(.headline)
                Text("\(item.category)")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.amountFormat)
        }
        .listRowSeparator(.hidden)
    }
    
    init(item: Money) {
        self.item = item
    }
}

#Preview {
    NavigationView {
        WalletView()
    }
//    WalletItem(item: Money(amount: 20000, product: "테스트", category: .deposit))
//    WalletItemDetailView(item: Money(amount: 2000, product: "test", category: .food))
}
