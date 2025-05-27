//
//  CountryService.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import Foundation

final class CountryService {
    static let shared = CountryService()

    func fetchCountries() async throws -> [Country] {
        guard let url = URL(string: "https://restcountries.com/v2/all") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Country].self, from: data)
    }
}
