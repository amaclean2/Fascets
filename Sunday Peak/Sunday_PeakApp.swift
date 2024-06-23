//
//  Sunday_PeakApp.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/11/24.
//

import SwiftUI

@main
struct Sunday_PeakApp: App {
    @StateObject var userViewModel = UserViewModel()
    @StateObject var adventureViewModel = AdventureViewModel()
    @StateObject var zoneViewModel = ZoneViewModel()
    @StateObject var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(userViewModel)
                .environmentObject(adventureViewModel)
                .environmentObject(zoneViewModel)
                .environmentObject(appViewModel)
        }
    }
}
