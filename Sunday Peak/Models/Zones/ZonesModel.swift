//
//  ZonesModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/20/24.
//

import SwiftUI
import Turf

struct AllZonesResponse: Codable {
    let data: ZonesObject
    let statusCode: Int
    let timestamp: Int64
    
    enum CodingKeys: String, CodingKey {
        case data
        case statusCode = "status_code"
        case timestamp
    }
}

struct ZonesObject: Codable {
    let zones: ZonesMapObject
}

struct ZonesMapObject: Codable {
    let ski: FeatureCollection?
    let hike: FeatureCollection?
    let bike: FeatureCollection?
    let climb: FeatureCollection?
    let skiApproach: FeatureCollection?
}

struct ZoneResponse: Codable {
    let data: ZoneDataObject
    let statusCode: Int
    let timestamp: Int64
    
    enum CodingKeys: String, CodingKey {
        case data
        case statusCode = "status_code"
        case timestamp
    }
}

struct ZoneDataObject: Codable {
    let zone: ZoneObject
}
