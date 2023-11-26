//
//  WeatherAPI.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 19.11.23.
//

import Foundation
import Alamofire
import CoreLocation
import Combine

class WeatherAPI : WebRepository {
    
    static let shared: WeatherAPI = WeatherAPI()
    
    private init() {}
    
    func getWeatherByLocation(location: CLLocationCoordinate2D) async -> DataWrapper<WeatherInCurrentLocationResponse> {
        let requestData = WeatherRouter.weatherByCurrentCoordinate(longitude: location.longitude, latitude: location.latitude)
        
        return await callAsync(urlRequest: requestData)
    }
}

