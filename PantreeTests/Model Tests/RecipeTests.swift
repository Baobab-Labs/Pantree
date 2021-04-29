//
//  RecipeTests.swift
//  PantreeTests
//
//  Created by Ben Hollar on 4/18/21.
//

import XCTest
@testable import Pantree

class RecipeTests: XCTestCase {
    
    func testCodable() {
        let recipe = Recipe(
            named: "Chili Garlic Shrimp Risotto",
            ingredients: [
                Ingredient(Food(named: "Garlic"),
                           amount: Measurement<UnitFood>(value: 1, unit: .ounce)),
                Ingredient(Food(named: "Lemon"),
                           amount: Measurement<UnitFood>(value: 1, unit: .ounce)),
                Ingredient(Food(named: "Shrimp"),
                           amount: Measurement<UnitFood>(value: 8, unit: .ounce)),
                Ingredient(Food(named: "Arborio Rice"),
                           amount: Measurement<UnitFood>(value: 0.75, unit: .cup)),
                Ingredient(Food(named: "Shredded Parmesan"),
                           amount: Measurement<UnitFood>(value: 2, unit: .ounce)),
                Ingredient(Food(named: "Scallions"),
                           amount: Measurement<UnitFood>(value: 2, unit: .ounce)),
                Ingredient(Food(named: "Chili Flakes"),
                           amount: Measurement<UnitFood>(value: 1, unit: .tablespoon)),
                Ingredient(Food(named: "Chicken Stock"),
                           amount: Measurement<UnitFood>(value: 4, unit: .cup)),
                Ingredient(Food(named: "Butter"),
                           amount: Measurement<UnitFood>(value: 1, unit: .tablespoon))
            ],
            instructions: [
                "Wash and dry all produce. Peel and finely chop garlic. Zest and halve lemon. Trim and thinly slice scallions, separating whites from greens.",
                "Rinse shrimp, then pat dry with paper towels. Place in a medium bowl with half the garlic, half the lemon zest, ½ tsp sugar (1 tsp for 4 servings), a drizzle of olive oil, and as many chili flakes as you’d like. Season with salt and pepper; toss to combine.",
                "In a large liquid measuring cup or bowl, combine 4 cups hot water (7 cups for 4 servings) and stock concentrate. Melt 1 TBSP butter (2 TBSP for 4) in a large pan over medium-high heat. Add scallion whites and remaining garlic. Cook, stirring, until fragrant, 1 minute. Add rice and cook, stirring, until grains are translucent, 1-2 minutes.",
                "Add ½ cup stock to pan with rice mixture. Cook, stirring, until liquid has absorbed. Repeat with remaining stock—adding ½ cup at a time and stirring until liquid has absorbed—until rice is al dente and creamy, 25-30 minutes. (Depending on the size of your pan, you may need a little more or a little less liquid.) Turn off heat; taste and season with salt and pepper.",
                "When risotto is almost done, heat a drizzle of olive oil in a second large pan over high heat. Add shrimp mixture. Cook, flipping once or twice, until shrimp is opaque and cooked through, 2-3 minutes. Stir in a squeeze of lemon juice. Turn off heat.",
                "Stir Parmesan, 1 TBSP butter (2 TBSP for 4 servings), and a squeeze of lemon juice into risotto until cheese and butter have melted. Taste and season generously with salt and pepper. Divide risotto between bowls and top with shrimp mixture, scallion greens, remaining lemon zest, and more chili flakes if desired."
            ]
        )
        
        let data = try! JSONEncoder().encode(recipe)
        let pathAsURL = try! FileManager.default.url(for: .applicationSupportDirectory,
                                                     in: .userDomainMask,
                                                     appropriateFor: nil,
                                                     create: true).appendingPathComponent("recipe.json")
        try! data.write(to: pathAsURL)
        XCTAssertTrue(FileManager.default.fileExists(atPath: pathAsURL.path))
        
        let encodedData = try! Data(contentsOf: pathAsURL)
        let decoded: Recipe = try! JSONDecoder().decode(Recipe.self, from: encodedData)
        XCTAssertEqual(recipe, decoded)
    }
    
}
