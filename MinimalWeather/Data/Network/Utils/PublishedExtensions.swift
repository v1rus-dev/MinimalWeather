//
//  PublishedExtensions.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import Foundation

//extension Publisher where Output == URLSession.DataTaskPublisher.Output {
//    func requestData(httpCodes: HTTPCodes = .success) -> AnyPublisher<Data, Error> {
//        return tryMap {
//                assert(!Thread.isMainThread)
//                guard let code = ($0.1 as? HTTPURLResponse)?.statusCode else {
//                    throw APIError.unexpectedResponse
//                }
//                guard httpCodes.contains(code) else {
//                    throw APIError.httpCode(code)
//                }
//                return $0.0
//            }
//            .extractUnderlyingError()
//            .eraseToAnyPublisher()
//    }
//}
//
//private extension Publisher where Output == URLSession.DataTaskPublisher.Output {
//    func requestJSON<Value>(httpCodes: HTTPCodes) -> AnyPublisher<Value, Error> where Value: Decodable {
//        return requestData(httpCodes: httpCodes)
//            .decode(type: Value.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//}
