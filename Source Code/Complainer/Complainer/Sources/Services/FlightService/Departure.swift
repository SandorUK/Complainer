//
//  Departure.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct Departure: Codable, Hashable {
    let iataCode: String
    let icaoCode: String
    let terminal: String?
    let delay: Int?
    let scheduledTime: Date?
    let estimatedTime: Date?
    let actualTime: Date?
    let estimatedRunway: Date?
    let actualRunway: Date?
}

extension Departure {
    
    var isDelayed: Bool {
        if let value = delay, value > 0 {
            return true
        }
        
        return false
    }
}
