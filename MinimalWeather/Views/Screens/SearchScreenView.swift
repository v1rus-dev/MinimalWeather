//
//  SearchScreenView.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import SwiftUI
import CoreData
import MapKit

struct SearchScreenView: View {
    
    @EnvironmentObject
    var searchViewModel: SearchViewModel
    
    @FetchRequest(sortDescriptors: [])
    var countries: FetchedResults<Country>
    
    @Environment(\.dismiss) var dismiss
    @State
    private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(countries.filter({ country in
                    country.name != nil
                })) { country in
                    NavigationLink {
                        SelectCityView(county: country)
                    } label: {
                        Text(country.name!)
                    }

                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Exit") {
                        dismiss()
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Country")
        }
        .onChange(of: searchText) { oldValue, newValue in
            countries.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "name CONTAINS[c] %@", newValue)
        }
        .onDisappear(perform: {
            searchText = ""
        })
    }
}

struct SelectCityView: View {
    @EnvironmentObject
    var searchViewModel: SearchViewModel
    
    @State
    var searchText: String = ""
    
    let county: Country
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Select city")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    SearchScreenView()
        .environmentObject(SearchViewModel.shared)
        .environment(\.managedObjectContext, PersistenceController.preview.getContext())
}
