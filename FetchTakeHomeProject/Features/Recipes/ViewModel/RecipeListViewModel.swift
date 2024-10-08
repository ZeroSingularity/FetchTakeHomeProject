//
//  RecipeListViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipes: [RecipeModel] = []
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func populateRecipes(url: URL = Constants.URLs.recipesURL) async {
        do {
            let recipeResponse = try await self.apiService.get(url: url) { data in
                return try? JSONDecoder().decode(RecipesResponce.self, from: data)
            }
            
            self.recipes = recipeResponse.recipes
        } catch {
            print(error.localizedDescription)
        }
    }
}
