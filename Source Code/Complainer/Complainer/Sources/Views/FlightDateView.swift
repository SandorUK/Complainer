//
//  FlightDateView.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct FlightDateView: View {
    
    @Environment(\.services) var services
    @EnvironmentObject var claim: Claim
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            ClaimHeader("dateOfTravel")
            VSpace(16)
            DatePicker("Time", selection: $selectedDate, in: ...Date(), displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .padding(.horizontal, -8)
            Spacer()
            MainButton(title: "next") {
                claim.date = selectedDate
            }.padding(.bottom, 32)

        }
        .padding(.horizontal, 32)
        PropertyNavigationItem(value: $claim.date, destination: FlightOriginView())
    }
}

struct FlightDateView_Previews: PreviewProvider {
    static var previews: some View {
        let claim = Claim(category: .flight(.cancelled))
//        let claim = Claim(category: .luggage(.damaged))
        
        FlightDateView()
            .environmentObject(claim)
    }
}
