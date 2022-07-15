//
//  Airport.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct Airport: Codable, Hashable {
    let code: String
    let lat: String
    let lon: String
    let name: String
    let city: String
    let state: String?
    let country: String
    let woeid: String
    let tz: String
    let phone: String
    let type: String
    let email: String
    let url: String
    let runwayLength: String?
    let elev: String?
    let icao: String
    let directFlights: String
    let carriers: String

    enum CodingKeys: String, CodingKey {
        case code
        case lat
        case lon
        case name
        case city
        case state
        case country
        case woeid
        case tz
        case phone
        case type
        case email
        case url
        case runwayLength = "runway_length"
        case elev
        case icao
        case directFlights = "direct_flights"
        case carriers
    }
}

extension Airport {
    
    static var example: Airport {
        .init(code: "AAA",
              lat: "-17.3595",
              lon: "-145.494",
              name: "Anaa Airport",
              city: "Anaa",
              state: "Tuamotu-Gambier",
              country: "French Polynesia",
              woeid: "12512819",
              tz: "Pacific/Midway",
              phone: "",
              type: "Airports",
              email: "",
              url: "",
              runwayLength: "4921",
              elev: "7",
              icao: "NTGA",
              directFlights: "2",
              carriers: "1")
    }
}
