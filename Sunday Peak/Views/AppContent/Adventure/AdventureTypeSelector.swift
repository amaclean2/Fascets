//
//  AdventureTypeSelector.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/23/24.
//

import SwiftUI

struct AdventureTypeSelector: View {
    @EnvironmentObject private var adventureViewModel: AdventureViewModel
    var body: some View {
        HStack {
            ForEach(AdventureType.allCases, id: \.self) { type in
                Button {
                    adventureViewModel.changeGlobalAdventureType(newType: type)
                } label: {
                    VStack {
                        Image(type.imageName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(10)
                            .foregroundStyle(adventureViewModel.globalAdventureType == type ? Color("MainLight") : Color("MainDark"))
                            .background(adventureViewModel.globalAdventureType == type ? Color.primaryAccent : Color("MainOffLight"))
                            .cornerRadius(50)
                    }
                }
            }
        }
    }
}

#Preview {
    AdventureTypeSelector()
}
