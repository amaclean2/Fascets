//
//  ZoneModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/20/24.
//

import Foundation

struct ZoneObject: Codable, Identifiable {
    let id: Int
    let zoneName: String
    let adventureType: AdventureType
    let bio: String
    let approach: String
    let nearestCity: String
    let dateCreated: Int64
    let creatorId: Int
    let creatorName: String
    let creatorEmail: String
    let creatorPictureUrl: String
    let coordinates: Coordinates
    let isPublic: Bool
    let adventures: [SubAdventure]
    let zones: [SubZone]
    let breadcrumb: [BreadcrumbObject]
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case zoneName = "zone_name"
        case adventureType = "adventure_type"
        case bio
        case approach
        case nearestCity = "nearest_city"
        case dateCreated = "date_created"
        case creatorId = "creator_id"
        case creatorName = "creator_name"
        case creatorEmail = "creator_email"
        case creatorPictureUrl = "creator_picture_url"
        case coordinates
        case isPublic = "public"
        case adventures
        case zones
        case breadcrumb
        case images
    }
}

struct SubAdventure: Codable, Identifiable {
    let id: Int
    let adventureType: AdventureType
    let isPublic: Bool
    let path: [[Decimal]]
    let coordinates: Coordinates
    
    enum CodingKeys: String, CodingKey {
        case id = "adventure_id"
        case adventureType = "adventure_type"
        case isPublic = "public"
        case path
        case coordinates
    }
}

struct SubZone: Codable, Identifiable {
    let id: Int
    let adventureType: AdventureType
    let zoneName: String
    let isPublic: Bool
    let coordinates: Coordinates
    
    enum CodingKeys: String, CodingKey {
        case id = "zone_id"
        case adventureType = "adventure_type"
        case zoneName = "zone_name"
        case isPublic = "public"
        case coordinates
    }
}

struct BreadcrumbObject: Codable, Identifiable {
    let id: Int
    let adventureType: AdventureType
    let name: String
    let categoryType: CategoryType
    
    enum CodingKeys: String, CodingKey {
        case id
        case adventureType = "adventure_type"
        case name
        case categoryType = "category_type"
    }
}

enum CategoryType: String, CaseIterable, Codable, Hashable {
    case adventure = "adventure"
    case zone = "zone"
}
