//
//  SearchViewModel.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import Foundation
import Combine
import MapKit

@MainActor
class SearchViewModel: ObservableObject {
    
    static let shared: SearchViewModel = SearchViewModel()
    private let placesRepository = PlacesRepository()
    private let searchRequest: MKLocalSearch.Request
    private let search: MKLocalSearch
    
    
    private init() {
        searchRequest = MKLocalSearch.Request()
        searchRequest.region = MKCoordinateRegion(.world)
        searchRequest.resultTypes = .address
        
        search = MKLocalSearch(request: self.searchRequest)
    }
    
    func updateSearch(newSearch: String) {
        searchRequest.naturalLanguageQuery = newSearch
    }
    
    private func loadCountries() {
        Task {
            print("Start load countries")
            await placesRepository.loadCountriesAndSave()
        }
    }
    
    private func observeSearch() {
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription)")
                return
            }
            
            for item in response.mapItems {
                print("SearchedItem: \(item)")
            }
        }
    }
    
}
