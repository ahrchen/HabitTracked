//
//  TextFieldManager.swift
//  HabitTracked
//
//  Created by Raymond Chen on 10/8/21.
//

import Foundation

class TextFieldManager: ObservableObject {
  
    @Published var characterLimit: Int
    @Published var userInput = "" {
        didSet {
            if userInput.count > characterLimit {
                userInput = String(userInput.prefix(characterLimit))
            }
        }
    }
    
    
    init(characterLimit: Int) {
        self.characterLimit = characterLimit
    }
    
}
