//
//  SubviewButtons.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/21/24.
//

import SwiftUI

struct SubviewButtons: View {
    var zones: [SubZone]
    var adventures: [SubAdventure]
    
    var body: some View {
        HStack {
            NavigationLink {
                SubzonesList(zones: zones)
            } label: {
                VStack(alignment: .leading) {
                    Text("Areas")
                        .font(.headline)
                        .foregroundStyle(Color.primaryAccent)
                    Text(String(zones.count))
                        .font(.title)
                        .foregroundStyle(Color("MainDark"))
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundStyle(Color("MainOffLight"))
                }
            }
            
            NavigationLink {
                
            } label: {
                VStack(alignment: .leading) {
                    Text("Adventures")
                        .font(.headline)
                        .foregroundStyle(Color.primaryAccent)
                    Text(String(adventures.count))
                        .font(.title)
                        .foregroundStyle(Color("MainDark"))
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundStyle(Color("MainOffLight"))
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    SubviewButtons(zones: [SubZone(id: 6, adventureType: .ski, zoneName: "Apples", isPublic: false, coordinates: Coordinates(lat: 3.0, lng: 2.0)), SubZone(id: 4, adventureType: .ski, zoneName: "Bananas", isPublic: false, coordinates: Coordinates(lat: 2.0, lng: 5.0))], adventures: [SubAdventure(id: 5, adventureType: .ski, isPublic: true, path: [[3.0, 5.0], [2.0, 3.0]], coordinates: Coordinates(lat: 2.0, lng: 10.0))])
}
