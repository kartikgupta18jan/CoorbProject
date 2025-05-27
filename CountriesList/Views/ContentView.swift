//
//  ContentView.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CountryViewModel()
    @State private var selectedCountry: Country?
        var body: some View {
            NavigationView {
                Group {
                    if viewModel.isLoading {
                        VStack {
                            ProgressView("Loading countries...")
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        List {
                            ForEach(viewModel.selectedCountries) { country in
                                Button(action: {
                                            selectedCountry = country
                                        }) {
                                            Text(country.name)
                                        }
                            }
                            .onDelete { indexSet in
                                indexSet.forEach { viewModel.removeCountry(viewModel.selectedCountries[$0]) }
                            }
                        }
                    }
                }
                .sheet(item: $selectedCountry) { country in
                    DetailView(country: country)
                }
                .navigationTitle("My Countries")
                .toolbar {
                    NavigationLink("Search", destination: SearchView(viewModel: viewModel))
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
