//
//  SearchView.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 18.11.23.
//

import SwiftUI

struct SearchPanelView: View {
    
    @Binding
    var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search city", text: $searchText)
            if (searchText.isEmpty) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(red: 0.77, green: 0.77, blue: 0.77))
            } else {
                Image(systemName: "xmark")
                    .foregroundStyle(Color(red: 0.77, green: 0.77, blue: 0.77))
                    .onTapGesture {
                        searchText.removeAll()
                    }
            }
        }
        .padding()
        .frame(height: 46)
        .background((RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.99, green: 0.99, blue: 0.99))))
        .padding()
    }
}

#Preview {
    SearchPanelView(searchText: .constant("Hello"))
}
