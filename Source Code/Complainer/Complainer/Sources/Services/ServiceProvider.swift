//
//  ServiceProvider.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import SwiftUI

struct ServiceProvider {
    @Injected(\.airport) var airport: AirportProviding
    @Injected(\.country) var country: CountryProviding
    @Injected(\.flight) var flight: FlightProviding

}

private struct ServiceProviderKey: EnvironmentKey {
  static let defaultValue = ServiceProvider()
}

extension EnvironmentValues {
    var services: ServiceProvider {
        get { self[ServiceProviderKey.self] }
        set { self[ServiceProviderKey.self] = newValue }
    }
}
