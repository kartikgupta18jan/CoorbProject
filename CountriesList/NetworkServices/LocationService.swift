//
//  LocationService.swift
//  CountriesList
//
//  Created by C 4 U on 27/05/25.
//

import Foundation
import CoreLocation

final class LocationService: NSObject, CLLocationManagerDelegate {
    static let shared = LocationService()
    private let manager = CLLocationManager()
    private var continuation: CheckedContinuation<String?, Never>?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestCountryName() async -> String? {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()

        return await withCheckedContinuation { continuation in
            self.continuation = continuation
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            continuation?.resume(returning: "India")
            return
        }

        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            let country = placemarks?.first?.country ?? "India"
            self.continuation?.resume(returning: country)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation?.resume(returning: "India")
    }
}
