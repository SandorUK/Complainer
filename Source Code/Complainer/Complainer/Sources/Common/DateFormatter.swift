//
//  DateFormatter.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import Foundation

extension DateFormatter {
    
    static var flightApiResponseDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd't'HH:mm:ss.SSS"
        return formatter
    }
    
    static var flightApiFilterDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    static var date: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    static var time: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }
}
