//
//  ComplainerApp.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 23/06/2022.
//

import SwiftUI

@main
struct ComplainerApp: App {
    
    @StateObject var claim = Claim()

    init() {
        let useAPIMock = ProcessInfo.processInfo.arguments.contains("mockFlightAPI")
        //        InjectedValues[\.country] = MockCountryProvider()
        //        InjectedValues[\.airport] = MockAirportProvider()
        if useAPIMock {
            InjectedValues[\.flight] = MockFlightProvider()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EntryView()
                    .navigationBarTitleDisplayMode(.inline)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environment(\.services, ServiceProvider())
            .environmentObject(claim)
        }
    }
}
