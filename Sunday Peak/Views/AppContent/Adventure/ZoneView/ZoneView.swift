//
//  ZoneView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/21/24.
//

import SwiftUI

struct ZoneView: View {
    @EnvironmentObject private var zoneViewModel: ZoneViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(zoneViewModel.currentZone!.zoneName)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primaryAccent)
                
                Text(displayText(for: zoneViewModel.currentZone!.adventureType))
                    .font(.subheadline)
                    .foregroundStyle(Color("MainOffDark"))
            }
            .padding(.bottom)
            
            if zoneViewModel.currentZone!.breadcrumb.count != 0 {
                Breadcrumb(breadcrumb: zoneViewModel.currentZone!.breadcrumb)
            }
            
            HStack {
                Image(uiImage: UIImage(named: "Pin")!)
                Text(zoneViewModel.currentZone!.nearestCity)
                    .font(.headline)
            }
            .padding(.vertical)
            
            Text(zoneViewModel.currentZone!.bio)
                .padding(.vertical)
            
            VStack(alignment: .leading) {
                Text("Approach")
                    .font(.headline)
                    .foregroundStyle(Color("MainOffDark"))
                Text(zoneViewModel.currentZone!.approach)
            }
            .padding(.vertical)
            
            SubviewButtons(zones: zoneViewModel.currentZone!.zones, adventures: zoneViewModel.currentZone!.adventures)
            
            CreatedBy(creator: zoneViewModel.creator!)
            Spacer()
        }
        .padding()
    }
            
    func displayText(for value: AdventureType) -> String {
        switch value {
        case .ski, .skiApproach:
            return "Ski Area"
        case .climb:
            return "Climb Area"
        case .hike:
            return "Hike Area"
        case .bike:
            return "Bike Area"
        }
    }
}

#Preview {
    ZoneView()
}
