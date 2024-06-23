//
//  AdventureModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/14/24.
//

import SwiftUI
import Turf

struct AllAdventuresResponse: Codable {
    let data: AdventuresObject
    let statusCode: Int
    let timestamp: Int64
    
    enum CodingKeys: String, CodingKey {
        case data
        case statusCode = "status_code"
        case timestamp
    }
}

struct AdventuresObject: Codable {
    let adventures: AdventuresMapObject
}

struct AdventuresMapObject: Codable {
    let ski: LinePointsSeparator?
    let hike: LinePointsSeparator?
    let bike: LinePointsSeparator?
    let climb: LinePointsSeparator?
    let skiApproach: LinePointsSeparator?
}

struct LinePointsSeparator: Codable {
    let lines: FeatureCollection?
    let points: FeatureCollection?
}

struct Coordinates: Codable {
    let lat: Decimal
    let lng: Decimal
}

enum AdventureType: String, CaseIterable, Codable, Hashable {
    case ski = "ski"
    case hike = "hike"
    case bike = "bike"
    case climb = "climb"
    case skiApproach = "skiApproach"
    
    var imageName: String {
        switch self {
        case .ski: return "SkierIconSvg"
        case .hike: return "HikerIconSvg"
        case .bike: return "BikerIconSvg"
        case .climb: return "ClimberIconSvg"
        case .skiApproach: return "TourerIconSvg"
        }
    }
}
