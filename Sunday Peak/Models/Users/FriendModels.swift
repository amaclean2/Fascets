//
//  FriendModels.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/14/24.
//

import SwiftUI

struct Friend: Codable, Identifiable {
    let id: Int
    let displayName: String
    let firstName: String
    let email: String
    let profilePictureUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case displayName = "display_name"
        case firstName = "first_name"
        case profilePictureUrl = "profile_picture_url"
        case email
    }
}
