//
//  RecipeCellViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import Foundation

struct RecipeCellViewModel: Identifiable {
    let recipe: RecipeModel
    init(recipe: RecipeModel) {
        self.recipe = recipe
    }
    
    var id: UUID? {
        UUID(uuidString: recipe.uuid ?? UUID().uuidString)
    }
}
