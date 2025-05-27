# CoorbProject
Description
This is a SwiftUI-based iOS mobile application that allows users to search and save countries, view capital cities and currencies, and auto-select the user's country based on location. It uses MVVM architecture, supports offline data storage, and is built with Swift Concurrency (async/await).

Features

1) Core Features
* REST Countries API integration using https://restcountries.com/v2/all
* Search countries by name with live filtering
* Add up to 5 countries to the main view
* Modal detail view displaying capital and currency
* Auto-add current country using GPS location (CoreLocation)
* Fallback to India if location permission is denied
* Checkmark indicators in the search list for saved countries
* Remove countries from the main list
* Alert when trying to add more than 5 countries
* Offline support using UserDefaults to cache selected countries

2) Architecture & Tools
* SwiftUI
* MVVM (Model-View-ViewModel)
* Swift Concurrency (async/await)
* CoreLocation
* UserDefaults for persistence
* Unit Testing with XCTest

3) Unit Tests
* Tests are included for the CountryViewModel, covering:
* Adding and removing countries
* Limiting selection to 5
* Persisting countries via UserDefaults
* Test cases are @MainActor compliant to safely access @Published UI state.

4) Requirements
* Xcode 13.4 (13F17a)
* iOS 15.0+
* Swift 5
* Internet connection for first-time API fetch

5) Installation
* Clone the repository
* Open the .xcodeproj or .xcworkspace in Xcode
* Run on a simulator or device
