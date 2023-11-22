//
//  AlamofireLogger.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 20.11.23.
//

import Foundation
import Alamofire

extension DataResponse {
    func log() {
        print("Reques: \(String(describing: self.request))")
        print("Response: \(String(describing: self.response))")
        print("Data: \(String(describing: self.data))")
    }
}
