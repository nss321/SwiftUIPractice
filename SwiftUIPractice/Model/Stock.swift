//
//  Stock.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/15/25.
//


struct Stock: Hashable {
    let name: String
    let currentPrice: Double
    let change: Double
    
    static var mock: [Self] {
        [
            Stock(name: "코스피", currentPrice: 2560.45, change: 12.34),
            Stock(name: "코스닥", currentPrice: 832.15, change: -5.67),
            Stock(name: "나스닥", currentPrice: 14520.78, change: 89.12),
            Stock(name: "S&P 500", currentPrice: 4850.32, change: -15.43),
            Stock(name: "다우존스", currentPrice: 38750.91, change: 45.67),
            Stock(name: "항셍지수", currentPrice: 16500.23, change: -32.10),
            Stock(name: "니케이 225", currentPrice: 39250.66, change: 78.90),
            Stock(name: "상해종합", currentPrice: 3050.88, change: 10.22),
            Stock(name: "FTSE 100", currentPrice: 7750.44, change: -8.99),
            Stock(name: "DAX", currentPrice: 18250.33, change: 22.15)
        ]
    }
}
