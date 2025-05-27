//
//  CountriesListTests.swift
//  CountriesListTests
//
//  Created by C 4 U on 27/05/25.
//

import XCTest
@testable import CountriesList

class CountriesListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testAddCountry() {
        let viewModel = CountryViewModel()
        let country = Country(name: "France", capital: "Paris", currencies: [])

        viewModel.addCountry(country)

        XCTAssertEqual(viewModel.selectedCountries.count, 1)
    }
    
    @MainActor
    func testAddCountryAsync() {
        let expectation = XCTestExpectation(description: "Add country to ViewModel")
        let viewModel = CountryViewModel()
        let country = Country(name: "France", capital: "Paris", currencies: [])

        Task { @MainActor in
            viewModel.addCountry(country)
            XCTAssertEqual(viewModel.selectedCountries.count, 5)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
