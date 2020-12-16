//
//  FishModel.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 8/5/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation

// MARK: - Fish
class FishModel: Codable, Identifiable {
    let id: Int
    let fileName: String
    let name: [String: String]
    let availability: FishModelAvailability
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
    
    public var checkCaught: Bool {
        if isCaught == nil {
            return false
        } else {
            return isCaught!
        }
    }
    
    public var checkDonated: Bool {
        if isDonated == nil {
            return false
        } else {
            return isDonated!
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
    
    init(id: Int, fileName: String, name: [String: String], availability: FishModelAvailability, shadow: String, price: Int, priceCj: Int, catchPhrase: String, museumPhrase: String, imageURI: String, iconURI: String, altCatchPhrase: [String]?, isCaught: Bool, isDonated: Bool) {
        self.id = id
        self.fileName = fileName
        self.name = name
        self.availability = availability
        self.shadow = shadow
        self.price = price
        self.priceCj = priceCj
        self.catchPhrase = catchPhrase
        self.museumPhrase = museumPhrase
        self.imageURI = imageURI
        self.iconURI = iconURI
        self.altCatchPhrase = altCatchPhrase
        self.isCaught = isCaught
        self.isDonated = isDonated
    }
}

struct FishModelAvailability: Codable {
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
//            months = "\(monthNorthern)"
            months = monthsString
        }
        return months
    }
    
    var monthsString: String {
        let str = monthNorthern
            .replacingOccurrences(of: "12", with: "Dec")
            .replacingOccurrences(of: "11", with: "Nov")
            .replacingOccurrences(of: "10", with: "Oct")
            .replacingOccurrences(of: "1", with: "Jan")
            .replacingOccurrences(of: "2", with: "Feb")
            .replacingOccurrences(of: "3", with: "Mar")
            .replacingOccurrences(of: "4", with: "Apr")
            .replacingOccurrences(of: "5", with: "May")
            .replacingOccurrences(of: "6", with: "Jun")
            .replacingOccurrences(of: "7", with: "Jul")
            .replacingOccurrences(of: "8", with: "Aug")
            .replacingOccurrences(of: "9", with: "Sep")
        return str
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
    
    var activeMonths: [Int]? {
        if let keys = monthArrayNorthern?.compactMap({ Int($0) }) {
            return keys
        }
        return nil
    }
}

var fishModelPreview = FishModel(id: 1, fileName: "bitterling", name: ["name-en": "bitterling"],
availability: FishModelAvailability(monthNorthern: "month-northern",
monthSouthern: "month-southern", time: FishTime(rawValue: "the4Am9Pm")!,
isAllDay: false, isAllYear: false, location: FishLocation(rawValue: "river")!,
rarity: FishRarity(rawValue: "common")!, monthArrayNorthern: [1, 2, 3],
monthArraySouthern: [10, 11, 12]),  shadow: "Smallest (1)", price: 900, priceCj: 13500,
catchPhrase: "I caught a bitterling! It's mad at me, but only a little.",
museumPhrase: "Bitterlings hide their eggs inside large bivalves—like clams—where the young can stay safe until grown. The bitterling isn't being sneaky. No, their young help keep the bivalve healthy by eating invading parasites! It's a wonderful bit of evolutionary deal making, don't you think? Each one keeping the other safe... Though eating parasites does not sound like a happy childhood... Is that why the fish is so bitter?",
imageURI: "https://acnhapi.com/v1/images/fish/1",
iconURI: "https://acnhapi.com/v1/iconss/fish/1",
altCatchPhrase: ["Alternate catch phrase"], isCaught: true, isDonated: false)
