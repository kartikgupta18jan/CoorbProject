//
//  DetailView.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import SwiftUI

struct DetailView: View {
    let country: Country

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Capital:")
                        .font(.headline)
                    Text("\(country.capital ?? "N/A")")
                }
                if let currency = country.currencies?.first {
                    HStack {
                        Text("Currency:")
                            .font(.headline)
                        Text("\(currency.name ?? "N/A") (\(currency.symbol ?? ""))")
                    }
                }
            }
            .padding()
            .navigationTitle(country.name)
        }
    }
}
