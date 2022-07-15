//
//  Flight.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct Flight: Codable, Hashable {
    let type: String
    let status: String
    let departure: Departure
    let arrival: Arrival
    let airline: Airline
    let flight: FlightInfo
}

extension Flight {
    
    static var example: Flight {
        .init(type: "departure",
              status: "active",
              departure: .init(iataCode: "bud",
                               icaoCode: "lhbp",
                               terminal: "2b",
                               delay: 9,
                               scheduledTime: Date(),
                               estimatedTime: Date(),
                               actualTime: Date(),
                               estimatedRunway: Date(),
                               actualRunway: Date()),
              arrival: .init(iataCode: "zth",
                             icaoCode: "lgza",
                             scheduledTime: Date(),
                             estimatedTime: Date(),
                             terminal: nil,
                             baggage: nil,
                             gate: nil),
              airline: .init(name: "smartwings",
                             iataCode: "qs",
                             icaoCode: "tvs"),
              flight: .init(number: "5098",
                            iataNumber: "qs5098",
                            icaoNumber: "tvs5098"))
    }
}
