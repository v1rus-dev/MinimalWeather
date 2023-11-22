//
//  DataWrapper.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import Foundation

enum DataWrapper<T> {
    case success(T)
    case failure(Error?)
}
