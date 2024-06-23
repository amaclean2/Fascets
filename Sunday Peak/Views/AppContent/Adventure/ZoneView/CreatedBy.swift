//
//  CreatedBy.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/22/24.
//

import SwiftUI

struct CreatedBy: View {
    @EnvironmentObject private var appViewModel: AppViewModel
    var creator: Creator
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Created By")
                .font(.headline)
                .foregroundStyle(Color("MainOffDark"))
            Button(creator.name) {
                appViewModel.setPageChoice(newPage: PageChoice.profile)
            }
            .foregroundStyle(Color.primaryAccent)
        }
    }
}

#Preview {
    CreatedBy(creator: Creator(id: 5, name: "Andrew Maclean", email: "andrew.n.maclean@gmail.com", pictureUrl: "https://api.sundaypeak.com/images/profile/IMG_6641.PNG"))
}
