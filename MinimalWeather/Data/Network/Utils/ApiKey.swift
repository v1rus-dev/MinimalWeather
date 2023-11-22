//
//  ApiKey.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 19.11.23.
//

import Foundation

class ApiKey {
    
    static let shared: ApiKey = ApiKey()
    
    private init() {}
    
    private let weatherApiKey = "WEATHER_API_KEY"
    private let placesApiKey = "PlACES_API_KEY"
    
    var weatherAPIKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
                fatalError("File Info.plist not fount")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: weatherApiKey) as? String else {
                fatalError("Not found key: \(weatherApiKey)")
            }
            return value
        }
    }
    
    var placesAPIKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
                fatalError("File Info.plist not fount")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: placesApiKey) as? String else {
                fatalError("Not found key: \(placesApiKey)")
            }
            return value
        }
    }
    
}
