//
//  RecipeCell.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import SwiftUI

struct RecipeCell: View {
    let viewModel: RecipeModel
    
    var body: some View {
        HStack(spacing: 10) {
            CachedImage(url: URL(string: viewModel.photo_url_small))
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                Text(viewModel.cuisine)
                    .font(.subheadline)
            }
        }
    }
}
