//
//  RecipeModel.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import Foundation

struct RecipeModel: Codable, Identifiable, Equatable {
    let cuisine: String
    let name: String
    let photo_url_large: String
    var photo_url_small: String
    let uuid: String
    var id: UUID? {
        UUID(uuidString: uuid)
    }
}

struct RecipesResponce: Codable {
    let recipes: [RecipeModel]
}
