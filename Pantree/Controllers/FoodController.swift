//
//  FoodController.swift
//  Pantree
//
//  Created by Ben Hollar on 4/29/21.
//

import Combine
import Foundation

public class FoodController : ObservableObject {
    
    @Published public var foods: [Food] = []
    
    private static var fileURL: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
                                          .appendingPathComponent("foods.json")
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    
    public func loadFoods() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.foods = [Food].stub(count: 10)
                }
                #endif
                return
            }
            guard let foods = try? JSONDecoder().decode([Food].self, from: data) else {
                fatalError("Can't decode saved food data.")
            }
            DispatchQueue.main.async {
                self?.foods = foods
            }
        }
    }
    
    public func saveFoods() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let foods = self?.foods else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(foods) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
    
}
