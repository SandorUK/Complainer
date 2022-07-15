//
//  FlightInfo.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct FlightInfo: Codable, Hashable {
    let number: String
    let iataNumber: String
    let icaoNumber: String
}
