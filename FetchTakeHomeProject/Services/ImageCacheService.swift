//
//  ImageCacheService.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import UIKit

enum ImageCacheServiceError: Error {
    case badRequest
    case unsupportedImage
    case badUrl
}

@MainActor
class ImageCacheService: ObservableObject {
    @Published var uiImage: UIImage?
    private static let cache = NSCache<NSString, UIImage>()
    
    func fetchImage(_ url: URL?) async throws {
        guard let url = url else {
            throw ImageCacheServiceError.badUrl
        }
        
        let request = URLRequest(url: filterURL(url: url))

        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString) {
            uiImage = cachedImage
        } else {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      throw ImageCacheServiceError.badRequest
                  }
            
            guard let image = UIImage(data: data) else {
                throw ImageCacheServiceError.unsupportedImage
            }

            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            uiImage = image
        }
    }
    
    func filterURL(url: URL) -> URL {
        var filteredURL = url.absoluteString
        if let dotRange = filteredURL.range(of: "/preview") {
            filteredURL.removeSubrange(dotRange.lowerBound..<filteredURL.endIndex)
        }
        
        return URL(string: filteredURL)!
    }
}
