//
//  PlacesRepository.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import CoreData

class PlacesRepository {
    private let api = PlacesAPI.shared
    private let persistenceController = PersistenceController.shared
    
    func loadCountriesAndSave() async {
        if persistenceController.isEmpty(entityName: "Country") {
            let result = await api.getAllCoutries()
            switch result {
            case .success(let data):
                let context = persistenceController.getContext()
                data.forEach { item in
                    let country = Country(context: context)
                    country.id = Int32(item.id)
                    country.name = item.name
                    country.ios2 = item.iso2
                }
                persistenceController.saveChangesByContext(context: context)
            case .failure(let error):
                print("Load countries error: \(error?.localizedDescription)")
            }
        }
    }
}
