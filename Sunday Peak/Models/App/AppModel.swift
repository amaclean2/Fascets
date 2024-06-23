//
//  AppModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/22/24.
//

import SwiftUI

enum PageChoice: String, CaseIterable, Codable, Hashable {
    case explore = "Explore"
    case adventure = "Adventure"
    case profile = "Profile"
    case chat = "Chat"
}

enum AdventureChoice: String, CaseIterable, Codable, Hashable {
    case zone = "Zone"
    case adventure = "Adventure"
    case zoneList = "Zone List"
    case adventureList = "Adventure List"
}
