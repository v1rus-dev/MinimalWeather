//
//  CityResponse.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 19.11.23.
//

import Foundation

struct CountryResponse: Decodable {
    let id: Int
    let name: String
    let iso2: String
}
