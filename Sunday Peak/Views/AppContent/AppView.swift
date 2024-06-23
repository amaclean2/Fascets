//
//  AppView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/11/24.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        TabView(selection: $appViewModel.appPage) {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "map.fill")
                }
                .tag(PageChoice.explore)
            AdventureTabView()
                .tabItem {
                    Label("Adventure", systemImage: "mountain.2.fill")
                }
                .tag(PageChoice.adventure)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(PageChoice.profile)
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
                .tag(PageChoice.chat)
        }
    }
}

#Preview {
    AppView()
}
