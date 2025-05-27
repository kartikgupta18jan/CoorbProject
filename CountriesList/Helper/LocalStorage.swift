//
//  LocalStorage.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import Foundation

final class LocalStorage {
    private let key = "SavedCountries"

    func save(_ countries: [Country]) {
        if let data = try? JSONEncoder().encode(countries) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func load() -> [Country] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let countries = try? JSONDecoder().decode([Country].self, from: data) else {
            return []
        }
        return countries
    }
}
