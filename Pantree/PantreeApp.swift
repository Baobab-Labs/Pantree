//
//  PantreeApp.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import SwiftUI

@main
struct PantreeApp: App {
    
    @ObservedObject private var foodController: FoodController = FoodController()
    
    var body: some Scene {
        WindowGroup {
            FoodsView(foods: $foodController.foods) {
                foodController.saveFoods()
            }
            .onAppear {
                foodController.loadFoods()
            }
        }
    }
}
