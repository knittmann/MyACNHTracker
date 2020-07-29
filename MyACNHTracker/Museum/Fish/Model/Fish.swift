//
//  Fish.swift
//  MyACNHTracker
//
//  Fish model for JSON data parsed from https://acnhapi.com
//
//  Created by Krista Nittmann on 6/14/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation


// MARK: - Fish
struct Fish: Codable, Identifiable {
    
    struct FishAvailability: Codable {
        let monthNorthern: String
        let monthSouthern: String
        let time: FishTime
        let isAllDay: Bool
        let isAllYear: Bool
        let location: FishLocation
        let rarity: FishRarity
        let monthArrayNorthern, monthArraySouthern: [Int]?

        enum CodingKeys: String, CodingKey {
            case monthNorthern = "month-northern"
            case monthSouthern = "month-southern"
            case time, isAllDay, isAllYear, location, rarity
            case monthArrayNorthern = "month-array-northern"
            case monthArraySouthern = "month-array-southern"
        }
        
        var availableMonths: String {
            var months = ""
            if isAllYear {
                months = "All Year"
            } else {
                months = "\(monthNorthern)"
            }
            return months
        }
        
        var availableTimes: String {
            var times = ""
            if isAllDay {
                times = "All Day"
            } else {
                times = "\(time.rawValue)"
            }
            return times
        }
    }
    
    let id: Int
    let fileName: String
    let name: [String: String]
    let availability: FishAvailability
    let shadow: String
    let price: Int
    let priceCj: Int
    let catchPhrase: String
    let museumPhrase: String
    let imageURI: String?
    let iconURI: String?
    let altCatchPhrase: [String]?
    let isCaught: Bool?
    let isDonated: Bool?
    
    public var localizedName: String {
        guard let languageCode = Locale.current.languageCode,
            let key = self.name.keys.first(where: { $0.suffix(2) == languageCode }),
            let localizedName = self.name[key]
            else {
                return self.name["name-en"] ?? self.name["name-USen"] ?? ""
        }
        return localizedName
    }
    
    public var altCatchPhraseArray : [String] {
       get {
         return altCatchPhrase ?? []
       }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, availability, shadow, price
        case priceCj = "price-cj"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
        case altCatchPhrase = "alt-catch-phrase"
        case isCaught = "is-caught"
        case isDonated = "is-donated"
    }
}

// MARK: Fish Enums

enum FishLocation: String, Codable {
    case pier = "Pier"
    case pond = "Pond"
    case river = "River"
    case riverClifftop = "River (Clifftop)"
    case riverClifftopPond = "River (Clifftop) & Pond"
    case riverMouth = "River (Mouth)"
    case sea = "Sea"
    case seaWhenRainingOrSnowing = "Sea (when raining or snowing)"
}

enum FishRarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case ultraRare = "Ultra-rare"
    case uncommon = "Uncommon"
}

enum FishTime: String, Codable {
    case empty = ""
    case the4Am9Pm = "4am - 9pm"
    case the4Pm9Am = "4pm - 9am"
    case the9Am4Pm = "9am - 4pm"
    case the9Am4Pm9Pm4Am = "9am - 4pm & 9pm - 4am"
    case the9Pm4Am = "9pm - 4am"
}

// MARK: - Fish localization names
struct FishName: Codable {
    let nameUSen, nameEUen, nameEUde, nameEUes: String
    let nameUSes, nameEUfr, nameUSfr, nameEUit: String?
    let nameEUnl, nameCNzh, nameTWzh, nameJPja: String?
    let nameKRko, nameEUru: String?

    enum CodingKeys: String, CodingKey {
        case nameUSen = "name-USen"
        case nameEUen = "name-EUen"
        case nameEUde = "name-EUde"
        case nameEUes = "name-EUes"
        case nameUSes = "name-USes"
        case nameEUfr = "name-EUfr"
        case nameUSfr = "name-USfr"
        case nameEUit = "name-EUit"
        case nameEUnl = "name-EUnl"
        case nameCNzh = "name-CNzh"
        case nameTWzh = "name-TWzh"
        case nameJPja = "name-JPja"
        case nameKRko = "name-KRko"
        case nameEUru = "name-EUru"
    }
}

var fishPreview = Fish(id: 1, fileName: "bitterling", name: ["name-en": "bitterling"],
    availability: Fish.FishAvailability(monthNorthern: "month-northern",
    monthSouthern: "month-southern", time: FishTime(rawValue: "the4Am9Pm")!,
    isAllDay: false, isAllYear: false, location: FishLocation(rawValue: "river")!,
    rarity: FishRarity(rawValue: "common")!, monthArrayNorthern: [1, 2, 3],
    monthArraySouthern: [10, 11, 12]),  shadow: "Smallest (1)", price: 900, priceCj: 13500,
    catchPhrase: "I caught a bitterling! It's mad at me, but only a little.",
    museumPhrase: "Bitterlings hide their eggs inside large bivalves—like clams—where the young can stay safe until grown. The bitterling isn't being sneaky. No, their young help keep the bivalve healthy by eating invading parasites! It's a wonderful bit of evolutionary deal making, don't you think? Each one keeping the other safe... Though eating parasites does not sound like a happy childhood... Is that why the fish is so bitter?",
    imageURI: "https://acnhapi.com/v1/images/fish/1",
    iconURI: "https://acnhapi.com/v1/iconss/fish/1",
    altCatchPhrase: ["Alternate catch phrase"], isCaught: true, isDonated: false)
