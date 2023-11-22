//
//  WeatherInCurrentLocationResponse.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 19.11.23.
//

import Foundation

struct WeatherInCurrentLocationResponse: Decodable {
    let coord: CoordResponse
    let weather: [WeatherResponse]
    let main: MainResponse
    let timezone: Int
    let id: Int64
    let name: String
    let cod: Int
}

struct CoordResponse: Decodable {
    let lon: Double
    let lat: Double
}

struct WeatherResponse: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct MainResponse: Decodable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Int?
    let humidity: Int?
}
