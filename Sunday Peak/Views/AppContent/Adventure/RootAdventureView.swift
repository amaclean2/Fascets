//
//  RootAdventureView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/23/24.
//

import SwiftUI

struct RootAdventureView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Local Adventures")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryAccent)
            AdventureTypeSelector()
        }
    }
}

#Preview {
    RootAdventureView()
}
