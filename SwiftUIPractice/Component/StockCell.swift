//
//  StockCell.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/15/25.
//

import SwiftUI

struct StockCell: View {
    
    let stock: Stock
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(stock.name)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            HStack {
                Text(String(format: "%.2f", stock.currentPrice))
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Text(String(format: "%+.2f", stock.change))
                    .font(.subheadline)
                    .foregroundColor(stock.change >= 0 ? .blue : .red)
            }
        }
        .padding()
        .background(Color.navy)
    }
}
