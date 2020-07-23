//
//  Creature.swift
//  MyACNHTracker
//
//  Codable creature data that retrieves fish and bug information from
//  "creatures.json"
//
//  Created by Krista Nittmann on 6/22/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation

// MARK: - Creature
struct Creature: Codable, Identifiable, Equatable {
    static func == (lhs: Creature, rhs: Creature) -> Bool {
        return lhs.name == rhs.name
    }
    
    let sourceSheet: String
    let id: Int16
    let name: String
    let iconImage: String?
    let critterpediaImage: String?
    let furnitureImage: String?
    let size: String?
    let surface: Bool?
    let sell: Int16?
    let whereHow: String?
    let shadow: String?
    let totalCatchesToUnlock: Int16?
    let spawnRates: String?
    let rainSnowCatchUp: Bool?
    let hhaBaseScore: Int16?
    let lightingType: String?
    let iconFilename: String?
    let critterpediaFilename: String?
    let furnitureFilename: String?
    let internalID: Int16?
    let uniqueEntryID: String?
    let colors: [String]?
    let specialSell: Int16?
    let activeMonths: Hemisphere?
    let weather: String?

    enum CodingKeys: String, CodingKey {
        case sourceSheet
        case id = "num"
        case name, iconImage, critterpediaImage, furnitureImage, size, surface
        case sell, whereHow, shadow, totalCatchesToUnlock, spawnRates
        case rainSnowCatchUp, hhaBaseScore, lightingType, iconFilename
        case critterpediaFilename, furnitureFilename
        case internalID
        case uniqueEntryID
        case colors, specialSell, activeMonths, weather
    }
}

// MARK: - Hemisphere
struct Hemisphere: Codable {
    let northern, southern: [ActiveMonths]?
}

// MARK: - ActiveMonths
struct ActiveMonths: Codable {
    let month: Int?
    let isAllDay: Bool?
    let activeHours: [[String]]?
    let season: Season?
}

// MARK: - Enums

enum Season: String, Codable {
    case autumn = "autumn"
    case spring = "spring"
    case summer = "summer"
    case winter = "winter"
}

enum CreatureLightingType: String, Codable {
    case emission = "Emission"
    case fluorescent = "Fluorescent"
}

enum SourceSheet: String, Codable {
    case fish = "Fish"
    case insects = "Insects"
}

enum Weather: String, Codable {
    case anyExceptRain = "Any except rain"
    case anyWeather = "Any weather"
    case rainOnly = "Rain only"
}

