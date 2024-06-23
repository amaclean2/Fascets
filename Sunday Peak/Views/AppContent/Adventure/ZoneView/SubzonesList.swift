//
//  SubzonesList.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/22/24.
//

import SwiftUI

struct SubzonesList: View {
    @EnvironmentObject private var zoneViewModel: ZoneViewModel
    var zones: [SubZone]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Areas in Donner Summit")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryAccent)
                .padding()
            List {
                ForEach(zones) { zone in
                    NavigationLink {
                        
                    } label: {
                        Text(zone.zoneName)
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}

#Preview {
    SubzonesList(zones: [SubZone(id: 5, adventureType: .ski, zoneName: "Donner Summit", isPublic: true, coordinates: Coordinates(lat: 5, lng: 2)), SubZone(id: 4, adventureType: .ski, zoneName: "Trestles Peak", isPublic: true, coordinates: Coordinates(lat: 8, lng: 9))])
}
