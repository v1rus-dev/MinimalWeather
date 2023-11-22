//
//  WebRepositoryUtils.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 20.11.23.
//

import Foundation
import Combine
import Alamofire

extension WebRepository {
    func call<Value>(urlRequest: ApiCall, httpCodes: HTTPCodes = .success) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try urlRequest.asURLRequest()
                return AF.request(request)
                .responseDecodable(of: Value.self, completionHandler: { dataResponse in
                    if let data = dataResponse.data, let utf8Text = String(data: data, encoding: .utf8) {
                            print("Data: \(utf8Text)")
                        }
                })
                    .validate()
                    .publishDecodable(type: Value.self)
                    .value()
                    .receive(on: DispatchQueue.main)
                    .mapError({ afError in
                        AppError.AlamofireError(alamofireError: afError)
                    })
                    .eraseToAnyPublisher()
        } catch let error {
            print("Error web repository \(error.localizedDescription)")
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
    
    func callAsync<Value>(urlRequest: ApiCall) async -> DataWrapper<Value> where Value: Decodable {
        do {
            let request = try urlRequest.asURLRequest()
            let task = AF.request(request).validate().serializingDecodable(Value.self)
            let value = try await task.value
            return DataWrapper.success(value)
        } catch let error {
            print("Error: \(error)")
            return DataWrapper.failure(error)
        }
    }
}
