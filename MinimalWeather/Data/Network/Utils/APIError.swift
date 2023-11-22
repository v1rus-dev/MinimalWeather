//
//  ApiError.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import Foundation

enum APIError: Swift.Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case imageDeserialization
}
