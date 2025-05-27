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

    func testAddRemoveCountry() async {
        let vm = CountryViewModel()
        await vm.loadCountries()

        let testCountry = Country(name: "Testland", capital: "Test City", currencies: [])

        vm.addCountry(testCountry)
        XCTAssertTrue(vm.selectedCountries.contains(testCountry))

        vm.removeCountry(testCountry)
        XCTAssertFalse(vm.selectedCountries.contains(testCountry))
    }
}
