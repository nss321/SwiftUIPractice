//
//  NetworkService.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/16/25.
//

import Foundation

struct NetworkService {
    static let shared = NetworkService()
    
    private init() { }
    
    func callRequest<T: Decodable>(api: Router, type: T.Type) async throws -> T {
        let url = api.endpoint
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw APIError.decodingError(error)
        }
    }
}

enum Router {
    case allMarkets
    
    var endpoint: URL {
        switch self {
        case .allMarkets:
            return URL(string: "https://api.upbit.com/v1/market/all")!
        }
    }
}

enum APIError: Error {
    case invalidResponse
    case decodingError(Error)
}
