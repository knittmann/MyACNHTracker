//
//  FishCD+CoreDataClass.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 7/29/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(FishCD)
//public class FishCD: NSManagedObject, Identifiable {
//    
//    // 'required' is needed for Decodable conformance
//    // 'convenice' to call self.init(entity:, insertInto)
//    required convenience public init(from decoder: Decoder) throws {
//
//        // first we need to get the context again
//        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { /* ... */ }
//
//        // then the entity we want to decode into, in this example it's the 'User' entity
//        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else { /* ... */ }
//
//        // init self with the entity and context we just got
//        self.init(entity: entity, insertInto: context)
//
//        // as usual we need a container, I skipped creating the CodingKeys enum since that should be trivial
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        // the rest is just doing the actual decoding, finally
//        // I decided to remove the '?' from the properties in the classes of my entities since I know the data will be there
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.filename = try container.decode(String.self, forKey: .filename)
//        self.imageURI = try container.decode(String.self, forKey: .imageURI)
//        self.iconURI = try container.decode(String.self, forKey: .iconURI)
//        self.museumPhrase = try container.decode(String.self, forKey: .museumPhrase)
//        self.shadow = try container.decode(String.self, forKey: .shadow)
//        self.price = try container.decode(Int.self, forKey: .price)
//        self.priceCJ = try container.decode(Int.self, forKey: .priceCJ)
//        // if you wanted to leave them option and use wrappers, just use 'decodeIfPresent' instead of just 'decode'
//
//        // the two not completely trivial properties are 'tags' and 'friends'
//        // for tags I just decode the data first, then save it into the entities property
//        let tagArray = try container.decode([String].self, forKey: .tags)
//        self.tags = tagArray.joined(separator: ", ")
//
//        // for friends I decode it as an array, then create an NSSet from that array
//        // of course this requires that 'Friend' conforms to decodable too, but you should know how to do that now ;)
//        let availability = try container.decode([FishCD].self, forKey: .availability)
//        self.availability = NSSet(array: availability)
//    }
//
//}
