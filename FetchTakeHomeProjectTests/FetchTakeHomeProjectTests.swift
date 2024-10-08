//
//  FetchTakeHomeProjectTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jacobo Hernandez on 10/7/24.
//

import XCTest
@testable import FetchTakeHomeProject

final class FetchTakeHomeProjectTests: XCTestCase {
    @MainActor
    let setup: RecipeListViewModel = RecipeListViewModel(apiService: APIService.shared)
    let testRecipe = RecipeModel(cuisine: "Malaysian",
                                 name: "Apam Balik",
                                 photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                                 photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                                 uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8")
    
    @MainActor
    func testRecipeDataSuccess() async {
        await setup.populateRecipes()
        XCTAssertEqual(testRecipe, setup.recipes[0])
        XCTAssertEqual(testRecipe.id, UUID(uuidString: setup.recipes[0].uuid))
    }
    
    @MainActor
    func testRecipeDataMalformed() async {
        await setup.populateRecipes(url: Constants.URLs.malformedRecipesURL)
        XCTAssertEqual([], setup.recipes)
    }
    
    @MainActor
    func testRecipeDataEmpty() async {
        await setup.populateRecipes(url: Constants.URLs.emptyRecipesURL)
        XCTAssertEqual([], setup.recipes)
    }
}
