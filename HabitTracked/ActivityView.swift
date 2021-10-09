//
//  ActivityView.swift
//  HabitTracked
//
//  Created by Raymond Chen on 10/8/21.
//

import SwiftUI

struct ActivityView: View {
    let activity: Activity
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                Text(self.activity.emoji)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 160))
                    .padding()
                Text(self.activity.name)
                    .frame(alignment: .center)
                    .padding()
                Text(self.activity.description)
                    .frame(alignment: .center)
                    .padding()
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: Activity(emoji: "😃", name: "Test",  description: "Testing"))
    }
}
