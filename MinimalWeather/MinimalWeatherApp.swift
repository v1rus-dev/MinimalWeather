//
//  MinimalWeatherApp.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 14.11.23.
//

import SwiftUI

@main
struct MinimalWeatherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
