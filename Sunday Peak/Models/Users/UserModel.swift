//
//  UserModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/12/24.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let bio: String?
    let city: String?
    let profilePictureURL: URL
    let friends: [Friend]?
    let completedAdventures: [CompletedAdventure]?
    let todoAdventures: [TodoAdventure]?
    let images: [URL]
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case bio
        case city
        case email
        case profilePictureURL = "profile_picture_url"
        case friends
        case images
        case completedAdventures = "completed_adventures"
        case todoAdventures = "todo_adventures"
    }
}

struct CompletedAdventure: Codable, Identifiable {
    let id: Int
    let adventureName: String
    let adventureType: AdventureType
    let nearestCity: String
    
    enum CodingKeys: String, CodingKey {
        case id = "adventure_id"
        case adventureName = "adventure_name"
        case adventureType = "adventure_type"
        case nearestCity = "nearest_city"
    }
}

struct TodoAdventure: Codable, Identifiable {
    let id: Int
    let adventureName: String
    let adventureType: AdventureType
    let nearestCity: String
    
    enum CodingKeys: String, CodingKey {
        case id = "adventure_id"
        case adventureName = "adventure_name"
        case adventureType = "adventure_type"
        case nearestCity = "nearest_city"
    }
}

struct Creator: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let pictureUrl: String
}
