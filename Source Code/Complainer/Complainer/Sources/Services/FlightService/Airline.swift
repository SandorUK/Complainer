//
//  Airline.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct Airline: Codable, Hashable {
    let name: String
    let iataCode: String
    let icaoCode: String
}
