//
//  FlightSelectorView.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct FlightSelectorView: View {
    
    @Environment(\.services) var services
    @EnvironmentObject var claim: Claim
    
    @State var flights: [Flight] = []
    @State var filteredFlights: [Flight] = []

    @State var searching = false
    @State var searchText = ""
    
    var body: some View {
        VStack {
            ClaimHeader("confirmFlight")
                .padding(.horizontal, 32)
            VSpace(16)
            SearchBar(searchText: $searchText, searching: $searching)
                .padding(.horizontal, 32)
            VSpace(16)
            List {
                Section() {
                    ForEach(filteredFlights, id: \.self) { value in
                        FlightRow(value: value)
                            .onTapGesture {
                                claim.flight = value
                            }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .accessibilityIdentifier("flightTable")
            PropertyNavigationItem(value: $claim.flight, destination: PassengerDataView())
        }
        .onAppear {
            Task {
                do {
                    flights = try await services.flight.findBy(departureCode: claim.origin?.code ?? "",
                                                               date: claim.date ?? Date(),
                                                               arrivalCode: claim.destination?.code)
                    filteredFlights = flights
                } catch {
                    print(error)
                }
            }
        }
        .onChange(of: searchText) { newValue in
            let flights = $flights.wrappedValue

            if newValue.isEmpty {
                filteredFlights = flights
            } else {
                filteredFlights = flights.filter {
                    $0.flight.iataNumber.lowercased().contains(newValue.lowercased())
                }
            }
        }
    }
}

struct FlightSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        let claim = Claim(category: .flight(.cancelled),
                          date: Date(),
                          origin: .example,
                          destination: .example)
        
        FlightSelectorView()
            .environmentObject(claim)
    }
}
