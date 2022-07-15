//
//  AirportService.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import SwiftUI

private struct AirportProviderKey: InjectionKey {
    static var currentValue: AirportProviding = AirportProvider()
}

extension InjectedValues {
    var airport: AirportProviding {
        get { Self[AirportProviderKey.self] }
        set { Self[AirportProviderKey.self] = newValue }
    }
}

protocol AirportProviding {
    func all() async throws -> [Airport]
    
    func findBy(code: String) async throws -> [Airport]
    func findBy(name: String) async throws -> [Airport]
}

struct AirportProvider: AirportProviding {
    @BundleFile(name: "airports") var items: [Airport]
    
    func all() async throws -> [Airport] {
        return items
    }
    
    func findBy(code: String) async throws -> [Airport] {
        return items.filter { $0.code == code }
    }
    
    func findBy(name: String) async throws -> [Airport] {
        return items.filter { $0.name.contains(name) }
    }
}
