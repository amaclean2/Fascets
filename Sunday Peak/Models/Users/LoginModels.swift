//
//  LoginModels.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/14/24.
//

import SwiftUI

struct LoginData: Encodable {
    let email: String
    let password: String
    let native: Bool
}

struct LoginResponseData: Codable {
    let user: User
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case token
    }
}

struct LoginErrorBody: Codable {
    let message: String
    let handled: Bool
}

struct LoginErrorResponse: Codable {
    let error: LoginErrorBody
    let statusCode: Int
    
    enum CodingKeys: String, CodingKey {
        case error
        case statusCode = "status_code"
    }
}

struct LoginResponse: Codable {
    let data: LoginResponseData
    let timestamp: Int64
    let statusCode: Int
    
    enum CodingKeys: String, CodingKey {
        case data
        case timestamp
        case statusCode = "status_code"
    }
}
