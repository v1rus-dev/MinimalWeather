//
//  WeatherRouter.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 19.11.23.
//

import Foundation
import Alamofire

protocol ApiCall {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }
}

enum WeatherRouter : ApiCall {
    
    case weatherByCurrentCoordinate(longitude: Double, latitude: Double);
    
    var baseURL: URL {
        URL(string: "https://api.openweathermap.org")!
    }
    
    var path: String {
        switch self {
            
        case .weatherByCurrentCoordinate:
            return "data/2.5/weather"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .weatherByCurrentCoordinate:
            return .get
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case let .weatherByCurrentCoordinate(longitude: longitude, latitude: latitude):
            return ["lat": String(format: "%f", latitude), "lon": String(format: "%f", longitude), "appid": ApiKey.shared.weatherAPIKey]
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}

extension ApiCall {
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
