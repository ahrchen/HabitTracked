//
//  Activity.swift
//  HabitTracked
//
//  Created by Raymond Chen on 10/8/21.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let emoji: String
    let name: String
    let description: String
}

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
