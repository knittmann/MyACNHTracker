//
//  FishCD+CoreDataProperties.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 7/29/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//
//

import Foundation
import CoreData


extension FishCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FishCD> {
        return NSFetchRequest<FishCD>(entityName: "FishCD")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int16
    @NSManaged public var filename: String?
    @NSManaged public var shadow: String?
    @NSManaged public var price: Int16
    @NSManaged public var priceCJ: Int16
    @NSManaged public var museumPhrase: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var imageURI: String?
    @NSManaged public var iconURI: String?
    @NSManaged public var isCaught: Bool
    @NSManaged public var isDonated: Bool
    @NSManaged public var altCatchPhrase: Array<Any>?
    @NSManaged public var availability: AvailabilityCD?

}
