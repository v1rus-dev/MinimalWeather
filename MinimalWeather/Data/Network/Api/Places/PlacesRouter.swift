//
//  CityRouter.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 19.11.23.
//

import Foundation
import Alamofire

enum PlacesRouter : ApiCall {
    
    case AllCountries
    
    var baseURL: URL {
        URL(string: "https://api.countrystatecity.in")!
    }
    
    var path: String{
        switch self {
        case .AllCountries:
            return "v1/countries"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .AllCountries:
            return .get
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .AllCountries:
            return [:]
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .AllCountries:
            return ["X-CSCAPI-KEY": ApiKey.shared.placesAPIKey]
        }
        
    }
}

extension PlacesRouter {
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        if let headers = self.headers {
            request.headers = HTTPHeaders(headers)
        }
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent)
            .encode(parameters, into: request)
        return request
    }
}
    
