//
//  APIError.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 6/16/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case unknown
    case message(reason: String), parseError(reason: String), networkError(reason: String)

    static func processResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        if (httpResponse.statusCode == 404) {
            throw APIError.message(reason: "Resource not found");
        }
        return data
    }

}
