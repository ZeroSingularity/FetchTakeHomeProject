//
//  RecipeListView.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import SwiftUI

struct RecipeListView: View {
    var viewModel: [RecipeModel]
    
    var body: some View {
        if viewModel.isEmpty {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack {
                        Text("No Recipes Available")
                        Text("Pull down to refresh")
                    }
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
                }
            }
        } else {
            List(viewModel) { recipe in
                RecipeCell(viewModel: recipe)
            }.listRowSpacing(10)
        }
    }
}
