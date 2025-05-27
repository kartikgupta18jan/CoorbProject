//
//  SearchView.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: CountryViewModel

    var body: some View {
        List(viewModel.filteredCountries) { country in
            Button {
                viewModel.addCountry(country)
            } label: {
                HStack {
                    Text(country.name)
                    Spacer()
                    if viewModel.selectedCountries.contains(country) {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchQuery)
        .navigationTitle("Search")
        .alert("Limit Reached", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("You can only add up to 5 countries.")
        }
    }
}
