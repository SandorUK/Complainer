//
//  CountryService.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation
import SwiftUI

private struct CountryProviderKey: InjectionKey {
    static var currentValue: CountryProviding = CountryProvider()
}

extension InjectedValues {
    var country: CountryProviding {
        get { Self[CountryProviderKey.self] }
        set { Self[CountryProviderKey.self] = newValue }
    }
}

protocol CountryProviding {
    func all() async throws -> [Country]
    
    func findBy(code: String) async throws -> [Country]
    func findBy(name: String) async throws -> [Country]
}

struct CountryProvider: CountryProviding {
    
    @BundleFile(name: "euro-countries") var items: [Country]

    func all() async throws -> [Country] {
        return items
    }
    
    func findBy(code: String) async throws -> [Country] {
        return items.filter { $0.code == code }
    }
    
    func findBy(name: String) async throws -> [Country] {
        return items.filter { $0.name.contains(name) }
    }
}
