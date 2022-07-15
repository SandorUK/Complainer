//
//  FlightOriginView.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

//TODO: Maybe this should be a re-usable class?
struct FlightOriginView: View {
    
    @Environment(\.services) var services
    @EnvironmentObject var claim: Claim
    
    @State var airports: [Airport] = []
    @State var filteredAirports: [Airport] = []

    @State var searching = false
    @State var searchText = ""
    
    var body: some View {
        VStack {
            ClaimHeader("origin")
                .padding(.horizontal, 32)
            VSpace(16)
            SearchBar(searchText: $searchText, searching: $searching)
                .padding(.horizontal, 32)
            VSpace(16)
            List {
                Section() {
                    ForEach(filteredAirports, id: \.self) { value in
                        Button {
                            claim.origin = value
                        } label: {
                            AirportRow(value: value)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .accessibilityIdentifier("originTable")
            PropertyNavigationItem(value: $claim.origin, destination: FlightDestinationView())
        }
        .onAppear {
            searchText = ""
            searching = false
            
            Task {
                airports = try await services.airport.all()
                filteredAirports = airports
            }
        }
        .onChange(of: searchText) { newValue in
            let airports = $airports.wrappedValue
            
            if newValue.isEmpty {
                filteredAirports = airports
            } else {
                //TODO: Refactor this into Airport Service
                filteredAirports = airports.filter {
                    $0.code.lowercased().contains(newValue.lowercased()) ||
                    $0.name.lowercased().contains(newValue.lowercased()) ||
                    $0.city.lowercased().contains(newValue.lowercased()) ||
                    $0.country.lowercased().contains(newValue.lowercased())
                }
            }
        }
    }
}

struct FlightOriginView_Previews: PreviewProvider {
    static var previews: some View {
        let claim = Claim(category: .flight(.cancelled),
                          date: Date())
        
        FlightOriginView()
            .environmentObject(claim)
    }
}
