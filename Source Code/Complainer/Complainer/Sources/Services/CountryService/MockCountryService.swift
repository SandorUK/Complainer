//
//  MockCountryService.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

struct MockCountryProvider: CountryProviding {
    func all() async throws -> [Country] {
        [
            .init(code: "TC1", name: "Test Country 1"),
            .init(code: "TC2", name: "Test Country 2"),
            .init(code: "TC3", name: "Test Country 3"),
        ]
    }
    
    func findBy(code: String) async throws -> [Country] {
        let values = try await all()
        return values.filter { $0.code == code }
    }
    
    func findBy(name: String) async throws -> [Country] {
        let values = try await all()
        return values.filter { $0.name.contains(name) }
    }
}
