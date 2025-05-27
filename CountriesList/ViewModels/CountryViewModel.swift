//
//  CountryViewModel.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import Foundation

@MainActor
final class CountryViewModel: ObservableObject {
    @Published var allCountries: [Country] = []
    @Published var selectedCountries: [Country] = []
    @Published var searchQuery = ""
    @Published var showAlert = false
    @Published var isLoading: Bool = false

    private let storage = LocalStorage()
    private let maxCountries = 5

    init() {
        Task {
            await self.loadCountries()
        }
    }

    func loadCountries() async {
        isLoading = true
        selectedCountries = storage.load()
        Task {
            do {
                allCountries = try await CountryService.shared.fetchCountries()
                if selectedCountries.isEmpty {
                    await handleLocation()
                }
            } catch {
                print("Failed to fetch countries:", error)
            }
            isLoading = false
        }
    }

    func addCountry(_ country: Country) {
        guard !selectedCountries.contains(country) else { return }
        if selectedCountries.count >= maxCountries {
            showAlert = true
            return
        }
        
        selectedCountries.append(country)
        storage.save(selectedCountries)
    }

    func removeCountry(_ country: Country) {
        selectedCountries.removeAll { $0 == country }
        storage.save(selectedCountries)
    }

    func handleLocation() async {
        let countryName = await LocationService.shared.requestCountryName()
        if let country = allCountries.first(where: { $0.name == countryName }) {
            addCountry(country)
        } else if let defaultCountry = allCountries.first(where: { $0.name == "India" }) {
            addCountry(defaultCountry)
        }
    }

    var filteredCountries: [Country] {
        if searchQuery.isEmpty { return allCountries }
        return allCountries.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
    }
}
