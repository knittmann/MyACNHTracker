//
//  CloudKitHelper.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 8/11/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation
import CloudKit

struct CloudKitHelper {
    
    

//    // MARK: Record Types
//    struct RecordType {
//        static let items = "Items"
//    }
//
//    // MARK: Errors
//    enum CloudKitHelperError: Error {
//        case recordFailure
//        case recordIDFailure
//        case castFailure
//        case cursorFailure
//    }
//
//    // MARK: Save to CloudKit
//    static func save(item: FishModel, completion: @escaping (Result<FishModel, Error>) -> ()) {
//        let itemRecord = CKRecord(recordType: RecordType.items)
//        itemRecord["id"] = item.id as CKRecordValue
//        itemRecord["fileName"] = item.fileName as CKRecordValue
//        itemRecord["localizedName"] = item.localizedName as CKRecordValue
//        itemRecord["availability"] = item.availability.activeMonths! as CKRecordValue
//        itemRecord["shadow"] = item.shadow as CKRecordValue
//        itemRecord["price"] = item.price as CKRecordValue
//        itemRecord["priceCj"] = item.priceCj as CKRecordValue
//        itemRecord["catchPhrase"] = item.catchPhrase as CKRecordValue
//        itemRecord["museumPhrase"] = item.museumPhrase as CKRecordValue
//        itemRecord["imageURI"] = item.imageURI! as CKRecordValue
//        itemRecord["iconURI"] = item.iconURI! as CKRecordValue
//        itemRecord["altCatchPhrase"] = item.altCatchPhrase! as CKRecordValue
//        itemRecord["isCaught"] = item.isCaught! as CKRecordValue
//        itemRecord["isDonated"] = item.isDonated! as CKRecordValue
//
//        CKContainer.default().publicCloudDatabase.save(itemRecord) { (record, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let record = record else {
//                completion(.failure(CloudKitHelperError.recordFailure))
//                return
//            }
//            let recordId = record.recordID
//            guard let fileName = record["fileName"] as? String else {
//                completion(.failure(CloudKitHelperError.castFailure))
//                return
//            }
//            let localizedName = record["localizedName"] as? String else {
//                completion(.failure(CloudKitHelperError.castFailure))
//                return
//            }
//            let shadow = record["shadow"]
//            let price = record["price"]
//            let priceCj = record["priceCj"]
//            let catchPhrase = record["catchPhrase"]
//            let museumPhrase = record["museumPhrase"]
//            let imageURI = record["imageURI"]
//            let iconURI = record["iconURI"]
//            let isCaught = record["isCaught"]
//            let isDonated = record["isDonated"]
//            guard let id = record["id"] as? Int else {
//                completion(.failure(CloudKitHelperError.castFailure))
//                return
//            }
//            guard let altCatchPhrase = record["altCatchPhrase"] as? [String] else {
//                completion(.failure(CloudKitHelperError.recordFailure))
//                return
//            }
//            let element = FishModel(id: id, fileName: fileName, name: localizedName, availability: <#T##FishModelAvailability#>, shadow: shadow, price: price, priceCj: priceCj, catchPhrase: catchPhrase, museumPhrase: museumPhrase, imageURI: imageURI, iconURI: iconURI, altCatchPhrase: [altCatchPhrase]?, isCaught: isCaught, isDonated: isDonated)
//        }
//    }
//
}
