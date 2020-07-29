//
//  ACNHApiManager.swift
//  MyACNHTracker
//
//  Manages fetching JSON data from https://acnhapi.com
//
//  Created by Krista Nittmann on 6/16/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation
import Combine

public struct ACNHApiManager {
    public static let BASE_URL = URL(string: "https://acnhapi.com/v1/")!
    private static var cache: [String: Codable] = [:]
    
    public enum Endpoint {
        case art
        case bugs
        case fish
        case fossils
        case villagers
        
        public func path() -> String {
            switch self {
            case .art:
                return "art"
            case .bugs:
                return "bugs"
            case .fish:
                return "fish"
            case .fossils:
                return "fossils"
            case .villagers:
                return "villagers"
            }
        }
        
        public func url() -> URL {
            ACNHApiManager.BASE_URL.appendingPathComponent(path())
        }
    }
    
    private static let decoder = JSONDecoder()
    
    public static func makeURL(endpoint: Endpoint) -> URL {
        let component = URLComponents(url: BASE_URL.appendingPathComponent(endpoint.path()), resolvingAgainstBaseURL: false)!
        return component.url!
    }
    
    public static func fetch<T: Codable>(endpoint: Endpoint) -> AnyPublisher<T, APIError> {
        
        if let cached = Self.cache[endpoint.path()] as? T {
            return Just(cached)
                .setFailureType(to: APIError.self)
                .eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: makeURL(endpoint: endpoint))
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap{ data, response in
                return try APIError.processResponse(data: data, response: response)
        }
        
        .decode(type: T.self, decoder: Self.decoder)
        
        .mapError{ APIError.parseError(reason: $0.localizedDescription) }
        
        .map({ result in
            Self.cache[endpoint.path()] = result
            return result
        })
        
            .eraseToAnyPublisher()
    }
}

