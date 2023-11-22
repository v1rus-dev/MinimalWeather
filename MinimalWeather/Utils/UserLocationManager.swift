//
//  UserLocationManager.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 18.11.23.
//

import Foundation
import CoreLocation

class UserLocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocation? = nil
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func checkUserPermission() -> Bool{
        let status = locationManager.authorizationStatus
        var result = false
        
        switch status {
        case .authorizedAlways:
            result = true
        case .authorizedWhenInUse:
            result = true
        default:
            result = false
        }
        return result
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            print("User location: \(latitude), \(longitude)")
            userLocation = CLLocation(latitude: latitude, longitude: longitude)
        } else {
            print("Location is empty")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocation()
    }
    
    func requestLocationAutorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    private func requestLocation() {
        if checkUserPermission() {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed: \(error.localizedDescription)")
    }
}
