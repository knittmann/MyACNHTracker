//
//  JsonApiManager.swift
//  MyACNHTracker
//
//  Class to load locally stored JSON files.
// 
//  Created by Krista Nittmann on 6/22/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation
import Combine

public struct JsonApiManager {
    private static let decoder = JSONDecoder()
    private static let apiQueue = DispatchQueue(label: "jsonQueue",
                                                qos: .userInitiated,
                                                attributes: .concurrent)
    
    public static func fetchJson<T: Codable>(name: String) -> AnyPublisher<T ,APIError> {
        Result(catching: {
            guard let url = Bundle.main.url(forResource: name, withExtension: nil) else {
                throw APIError.message(reason: "Error loading JSON file")
            }
            return try Data(contentsOf: url)
        })
            .publisher
            .decode(type: T.self, decoder: Self.decoder)
            .mapError{ APIError.parseError(reason: $0.localizedDescription) }
            .subscribe(on: Self.apiQueue)
            .eraseToAnyPublisher()
    }
    
    
    
//    static func fetchJson(name: String) -> Data
//    {
//        var json: Data
//        if let path = Bundle.main.path(forResource: name, ofType: "json") {
//            do {
//                let fileUrl = URL(fileURLWithPath: path)
//                // Getting data from JSON file using the file URL
//                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
//                json = try? JSONSerialization.jsonObject(with: data)
//            } catch {
//                print("Unable to read local JSON file: \(name)")
//            }
//        }
//        return json
//    }
}


/// Code from https://www.hackingwithswift.com/example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
