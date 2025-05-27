//
//  Country.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import Foundation

struct Country: Codable, Identifiable, Equatable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name
    }
    
    let id = UUID()
    let name: String
    let capital: String?
    let currencies: [Currency]?

    struct Currency: Codable {
        let code: String?
        let name: String?
        let symbol: String?
    }

    enum CodingKeys: String, CodingKey {
        case name, capital, currencies
    }
}
