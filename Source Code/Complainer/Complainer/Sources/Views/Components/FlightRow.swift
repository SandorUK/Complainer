//
//  AirportRow.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct FlightRow: View {
    let value: Flight
    @EnvironmentObject var claim: Claim

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    VSpace(8)
                    Label(value.departure.iataCode.uppercased(), size: 24)
                    if let date = value.departure.scheduledTime {
                        Label(DateFormatter.time.string(from: date), size: 16)
                    }
                    Label(claim.origin?.city ?? "", size: 14, style: .medium)
                        .foregroundColor(.gray)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                Image("airplane")
                    .renderingMode(.template)
                    .foregroundColor(value.departure.isDelayed ? .red : .black)
                Spacer()
                VStack(alignment: .trailing, spacing: 6) {
                    VSpace(8)
                    Label(value.arrival.iataCode.uppercased(), size: 24)
                    if let date = value.arrival.scheduledTime {
                        Label(DateFormatter.time.string(from: date), size: 16)
                    }
                    Label(claim.destination?.city ?? "", size: 14, style: .medium)
                        .foregroundColor(.gray)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            }
            Color(.gray)
                .frame(height: 1)
                .opacity(0.25)
            HStack {
                    if let actualTime = value.departure.actualTime {
                        Label(DateFormatter.date.string(from: actualTime), size: 14)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                
                Spacer()
                
                if let value = value.departure.delay {
                    Label("Delayed \(value) minutes", size: 14)
                        .foregroundColor(Color(uiColor: .systemRed))
                        .opacity(0.8)
                        .multilineTextAlignment(.center)
                        .frame(minHeight: 0, maxHeight: .infinity)
                    Spacer()
                }
                
                Label(value.flight.iataNumber.uppercased(), size: 14)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }
            .frame(height: 32)
            VSpace(8)
        }
        .contentShape(Rectangle())
    }
}
