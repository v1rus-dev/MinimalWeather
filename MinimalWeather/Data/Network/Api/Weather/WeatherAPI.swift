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
    
    func getWeatherByLocation(location: CLLocation) -> AnyPublisher<WeatherInCurrentLocationResponse, Error> {
        let requestData = WeatherRouter.weatherByCurrentCoordinate(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
        
        let request: AnyPublisher<WeatherInCurrentLocationResponse, Error> = call(urlRequest: requestData)
        
        return request
            .eraseToAnyPublisher()
    }
}

