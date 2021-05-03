//
//  FoodsView.swift
//  Pantree
//
//  Created by Ben Hollar on 4/29/21.
//

import SwiftUI

/// A view dedicated to the display of a single food in a compact manner.
///
/// Use this view for lists or other visual collections of foods where _some_ detail is helpful, but exhaustive detail would be too cumbersome or large.
struct CompactFoodView: View {
    
    @State var food: Food
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(food.name).font(.headline)
            HStack {
                if (food.canonicalNutrition?.calories != nil) {
                    Text(String(format: "%.0f kcal", food.canonicalNutrition!.calories!)).font(.caption)
                }
                Spacer()
                if (food.canonicalMeasurement != nil) {
                    Text(String(format: "%0.2f \(food.canonicalMeasurement!.unit.symbol)",
                                food.canonicalMeasurement!.value))
                        .font(.caption)
                }
            }
        }
    }
    
}

struct FoodsView: View {
    
    @Binding var foods: [Food]
    
    @Environment(\.scenePhase) private var scenePhase: ScenePhase
    
    let saveAction: () -> Void
    
    var body: some View {
        NavigationView {
            List {
                ForEach(foods) { food in
                    CompactFoodView(food: food)
                }
                .onDelete(perform: deleteFoods)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Foods")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // TODO: This _should_ present a View to manually add a food, but that view doesn't exist yet
                    Button(action: { foods.append(Food.stub().setting(\.name, to: "New Food")) }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        .onChange(of: scenePhase) { phase in
            if (phase == .inactive) { saveAction() }
        }
    }
    
    private func deleteFoods(at offsets: IndexSet) {
        foods.remove(atOffsets: offsets)
    }
    
}

struct FoodsView_Previews: PreviewProvider {
    static var previews: some View {
        FoodsView(foods: .constant([Food].stub(count: 20)), saveAction: {})
    }
}
