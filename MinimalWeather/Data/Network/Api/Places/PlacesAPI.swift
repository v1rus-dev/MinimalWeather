//
//  PlacesAPI.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import Foundation
import Combine

class PlacesAPI: WebRepository {
    
    static let shared: PlacesAPI = PlacesAPI()
    
    private init() {}
    
    func getAllCoutries() async -> DataWrapper<[CountryResponse]> {
        let request = PlacesRouter.AllCountries
        return await callAsync(urlRequest: request)
    }
    
}
