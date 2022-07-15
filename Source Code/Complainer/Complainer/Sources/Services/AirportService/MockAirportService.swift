//
//  MockAirportService.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct MockAirportProvider: AirportProviding {
    func all() async throws -> [Airport] {
        [
            .example,
            .init(code: "AAE",
                  lat: "36.8236",
                  lon: "7.8103",
                  name: "El Mellah Airport",
                  city: "El Tarf",
                  state: "Annaba",
                  country: "Algeria",
                  woeid: "12510325",
                  tz: "Africa/Algiers",
                  phone: "",
                  type: "Airports",
                  email: "",
                  url: "",
                  runwayLength: "9843",
                  elev: "16",
                  icao: "DABB",
                  directFlights: "6",
                  carriers: "2")
        ]
    }
    
    func findBy(code: String) async throws -> [Airport] {
        let values = try await all()
        return values.filter { $0.code == code }
    }
    
    func findBy(name: String) async throws -> [Airport] {
        let values = try await all()
        return values.filter { $0.name.contains(name) }
    }
}
