//
//  Constants.swift
//  FetchTakeHomeProject
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import Foundation

struct Constants {
    struct URLs {
        static let recipesURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
        static let malformedRecipesURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
        static let emptyRecipesURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
    }
}
