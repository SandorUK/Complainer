//
//  MockFlightService.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct MockFlightProvider: FlightProviding {
    func findBy(departureCode: String, date: Date, arrivalCode: String?) async throws -> [Flight] {
        [
            .example,
            .init(type: "departure",
                  status: "active",
                  departure: .init(iataCode: "bud",
                                   icaoCode: "lhbp",
                                   terminal: "2b",
                                   delay: 8,
                                   scheduledTime: Date(),
                                   estimatedTime: Date(),
                                   actualTime: Date(),
                                   estimatedRunway: Date(),
                                   actualRunway: Date()),
                  arrival: .init(iataCode: "got",
                                 icaoCode: "esgg",
                                 scheduledTime: Date(),
                                 estimatedTime: nil,
                                 terminal: "t1",
                                 baggage: "4",
                                 gate: "15"),
                  airline: .init(name: "ryanair",
                                 iataCode: "fr",
                                 icaoCode: "ryr"),
                  flight: .init(number: "6748",
                                iataNumber: "fr6748",
                                icaoNumber: "ryr6748"))
        ]
    }
}
