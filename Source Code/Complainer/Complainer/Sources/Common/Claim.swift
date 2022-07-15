//
//  Claim.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import SwiftUI
import Combine

class Claim: ObservableObject {
    @Published var didStart: Bool
    @Published var category: Category?
    @Published var date: Date?
    @Published var origin: Airport?
    @Published var destination: Airport?
    @Published var flight: Flight?
    @Published var firstName: String?
    @Published var lastName: String?
    @Published var bookingReference: String?
    @Published var email: String?
    @Published var phone: String?

    init(didStart: Bool = false,
        category: Category? = nil,
        date: Date? = nil,
        origin: Airport? = nil,
        destination: Airport? = nil,
        flight: Flight? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        bookingReference: String? = nil,
        email: String? = nil,
        phone: String? = nil) {
        self.didStart = didStart
        self.category = category
        self.date = date
        self.origin = origin
        self.destination = destination
        self.flight = flight
        self.firstName = firstName
        self.lastName = lastName
        self.bookingReference = bookingReference
        self.email = email
        self.phone = phone
    }
    
    func hasUserDetails() -> Bool {
        guard let firstName = firstName,
              let lastName = lastName,
              let bookingReference = bookingReference
        else {
            return false
        }
        
        return !firstName.isEmpty && !lastName.isEmpty && !bookingReference.isEmpty
    }
    
    func hasUserContactDetails() -> Bool {
        guard let phone = phone,
              let email = email
        else {
            return false
        }
        
        return !phone.isEmpty && !email.isEmpty
    }
    
    func reset() {
        didStart = false
        category = nil
        date = nil
        origin = nil
        destination = nil
        flight = nil
        firstName = nil
        lastName = nil
        bookingReference = nil
        email = nil
        phone = nil
    }
}

extension Claim {
    enum Category {
        enum Flight: String, CaseIterable, Identifiable {
            case cancelled
            case delayed
            case overbooked
            case deniedBoarding
            
            var id: RawValue { rawValue }
            
            var title: LocalizedStringKey {
                switch self {
                case .delayed: return "whatHappened_flightDelayed"
                case .cancelled: return "whatHappened_flightCancelled"
                case .overbooked: return "whatHappened_flightOverbooked"
                case .deniedBoarding: return "whatHappened_flightDeniedBoarding"
                }
            }
        }
        
        enum Luggage: String, CaseIterable, Identifiable {
            case lost
            case damaged
            case delayed
            
            var id: RawValue { rawValue }
            
            var title: LocalizedStringKey {
                switch self {
                case .delayed: return "whatHappened_luggageDelayed"
                case .damaged: return "whatHappened_luggageDamaged"
                case .lost: return "whatHappened_luggageLost"
                }
            }
        }
        
        case flight(Flight)
        case luggage(Luggage)
        
        var icon: UIImage {
            switch self {
            case .flight: return UIImage(named: "airplane")!
            case .luggage: return UIImage(named: "luggage")!
            }
        }
        
        var title: LocalizedStringKey {
            switch self {
            case .flight: return "flight"
            case .luggage: return "luggage"
            }
        }
        
        var subTitle: LocalizedStringKey {
            switch self {
            case .flight(let value):
                return value.title
            case .luggage(let value):
                return value.title
            }
        }
    }
}
