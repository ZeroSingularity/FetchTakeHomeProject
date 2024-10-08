//
//  CachedImage.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import SwiftUI

struct CachedImage: View {
    let url: URL?
    @StateObject private var imageCacheService = ImageCacheService()
    
    var body: some View {
        VStack {
            if let uiImage = imageCacheService.uiImage {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                ProgressView()
            }
        }.task {
            await downloadImage()
        }
    }
    
    private func downloadImage() async {
        do {
            try await imageCacheService.fetchImage(url)
        } catch {
            print(error)
        }
    }
}
