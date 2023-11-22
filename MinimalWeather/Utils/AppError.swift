//
//  AppError.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 20.11.23.
//

import Foundation
import Alamofire

enum AppError: Error {
    case AlamofireError(alamofireError: AFError)
}
