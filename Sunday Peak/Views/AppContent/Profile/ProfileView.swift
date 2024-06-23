//
//  Profile.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/11/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Header()
                .offset(y: 200)
        }
        
    }
}


#Preview {
    ProfileView()
}
