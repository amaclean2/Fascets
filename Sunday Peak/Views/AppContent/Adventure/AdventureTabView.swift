//
//  AdventureTabView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/11/24.
//

import SwiftUI

struct AdventureTabView: View {
    @EnvironmentObject private var zoneViewModel: ZoneViewModel
    @EnvironmentObject private var adventureViewModel: AdventureViewModel
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack() {
            RootAdventureView()
        }
    }
}

#Preview {
    AdventureTabView()
}
