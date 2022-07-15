//
//  Arrival.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct Arrival: Codable, Hashable {
    let iataCode: String
    let icaoCode: String
    let scheduledTime: Date?
    let estimatedTime: Date?
    let terminal: String?
    let baggage: String?
    let gate: String?
}
