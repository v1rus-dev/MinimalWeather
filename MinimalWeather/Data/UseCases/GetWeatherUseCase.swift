//
//  GetWeatherUseCase.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 27.11.23.
//

import Foundation
import CoreLocation

class GetWeatherUseCase {
    
    private let api: WeatherAPI = WeatherAPI.shared
    
    func getWeatherByLocation(location: CLLocationCoordinate2D) async {
        let result = await api.getWeatherByLocation(location: location)
        
        switch result {
        case .success(let data):
            print("Success getting information: \(data)")
        case .failure(let error):
            print("Error in getting weather: \(String(describing: error?.localizedDescription))")
        }
    }
    
}
