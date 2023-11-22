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
    @Published var locationManager = UserLocationManager()
    private var cancellables = Set<AnyCancellable>()
    private var weatherApi = WeatherAPI.shared
    
    init() {
        getLocationAfterLaunch()
    }
    
    func requestLocationAutorization() {
        locationManager.requestLocationAutorization()
    }
    
    func getWeather(location: CLLocation) async {
        weatherApi.getWeatherByLocation(location: location)
            .sinkToLoadable({ loadable in
                print("Error: \(loadable.error)")
                print("Succes: \(loadable.value)")
            })
            .store(in: &cancellables)
    }
    
    private func getLocationAfterLaunch() {
        locationManager.$userLocation.sink { newLocation in
            print("NewLocation: \(String(describing: newLocation))")
            
            if let location = newLocation {
                Task {
                    await self.getWeather(location: location)
                }
            }
        }.store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
}
