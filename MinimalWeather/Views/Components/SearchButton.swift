//
//  SearchButton.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//

import SwiftUI

struct SearchButton: View {
    
    var onClick: () -> Void
    
    var body: some View {
        HStack {
            Text("Search city")
                .foregroundStyle(Color(red: 0.77, green: 0.77, blue: 0.77))
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color(red: 0.77, green: 0.77, blue: 0.77))
        }
        .padding()
        .frame(height: 46)
        .background((RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.99, green: 0.99, blue: 0.99))))
        .padding()
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    SearchButton(onClick: {})
}
