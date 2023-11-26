//
//  ContentView.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 14.11.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject
    private var mainViewModel: MainViewModel = MainViewModel()
    
    @State
    private var isOpenSearchSheet: Bool = false

    var body: some View {
        NavigationView {
            VStack {

            }
            .refreshable {
                await mainViewModel.getWeather()
            }
        }
        .onAppear(perform: {
            mainViewModel.requestLocationAutorization()
        })
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
