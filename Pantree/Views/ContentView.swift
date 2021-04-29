//
//  ContentView.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        Button("Debug") {
            let ingredient = Measurement<UnitFood>(value: 1, unit: .ounce).converted(to: .pound)
            print(ingredient.description)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
