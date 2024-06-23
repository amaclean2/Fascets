//
//  UserAPIService.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/12/24.
//

import Foundation
import KeychainAccess

enum NetworkError: Error {
    case unauthorized
    case invalidURL
}

class UserAPIService {
    let baseUserUrl = URL(string: "https://api.sundaypeak.com/users")!
    let keychain = Keychain(service: "com.sundaypeak.app")
}
