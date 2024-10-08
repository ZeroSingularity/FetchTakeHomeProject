//
//  APIService.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import Foundation

enum ApiServiceError: Error {
    case badRequest
    case decodingError
}

class APIService {
    static let shared = APIService()
    
    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw ApiServiceError.badRequest
        }
        
        guard let result = parse(data) else {
            throw ApiServiceError.decodingError
        }
        
        return result
    }
}
