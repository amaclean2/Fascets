//
//  MainView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/12/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var adventureViewModel: AdventureViewModel
    @EnvironmentObject private var zoneViewModel: ZoneViewModel
    
    var body: some View {
        Group {
            if (self.userViewModel.loggedInUser == nil) {
                LoginView()
            } else {
                AppView()
            }
        }
        .onAppear {
            adventureViewModel.handleGetAllAdventures(adventureType: .ski)
        }
        .task {
            await zoneViewModel.handleGetAllZones(adventureType: .ski)
        }
    }
}

#Preview {
    MainView()
}
