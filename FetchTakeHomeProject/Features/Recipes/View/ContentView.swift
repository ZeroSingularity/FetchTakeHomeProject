//
//  ContentView.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: RecipeListViewModel = RecipeListViewModel(apiService: APIService.shared)
    
    var body: some View {
        RecipeListView(viewModel: viewModel.recipes)
            .task {
                await viewModel.populateRecipes()
            }
            .refreshable { await refresh() }
    }
    
    func refresh() async {
        await viewModel.populateRecipes()
    }
}

#Preview {
    ContentView()
}
