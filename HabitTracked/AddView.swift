//
//  AddView.swift
//  HabitTracked
//
//  Created by Raymond Chen on 10/8/21.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var description = ""
    
    @ObservedObject var activities: Activities
    @ObservedObject var emojiTextFieldManager = TextFieldManager(characterLimit: 1)
    @ObservedObject var nameTextFieldManager = TextFieldManager(characterLimit: 25)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                       Text("Emoji")
                        TextField("", text: $emojiTextFieldManager.userInput)
                    }
                }
                TextField("Name", text:$nameTextFieldManager.userInput)
                VStack(alignment: .leading) {
                    Text("Description")
                    TextEditor(text: $description)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
                
                
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button("Save") {
                let item = Activity(emoji: self.emojiTextFieldManager.userInput, name: self.nameTextFieldManager.userInput, description: self.description)
                self.activities.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        } 
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
