//
//  MainViewModel.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 18.11.23.
//

import Foundation
import CoreLocation
import Combine

@MainActor
class MainViewModel : ObservableObject {
    
    private let getWeatherUseCase = GetWeatherUseCase()
    
    @Published var locationManager = UserLocationManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getLocationAfterLaunch()
    }
    
    func requestLocationAutorization() {
        locationManager.requestLocationAutorization()
    }
    
    func getWeather() async {
        if let location = locationManager.userLocation?.coordinate {
            await getWeatherUseCase.getWeatherByLocation(location: location)
        }
    }
    
    private func getLocationAfterLaunch() {
        locationManager.$userLocation.sink { newLocation in
            print("NewLocation: \(String(describing: newLocation))")
            
            Task {
                await self.getWeather()
            }
        }.store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
}
