//
//  ContentView.swift
//  HabitTracked
//
//  Created by Raymond Chen on 10/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink(destination: ActivityView(activity: activity)) {
                        HStack {
                            Text(activity.emoji)
                            VStack(alignment: .leading) {
                                Text(activity.name)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Habit Tracked")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
                }
                
            )
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: self.activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
