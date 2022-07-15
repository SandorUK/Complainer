//
//  PassengerDataView.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 24/06/2022.
//
import SwiftUI

struct PassengerDataView: View {
    
    @Environment(\.services) var services
    @EnvironmentObject var claim: Claim
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var bookingReference: String = ""
    @State var hasUserDetails = false
    
    var body: some View {
        VStack {
            ClaimHeader("passengerDetails")
                .padding(.horizontal, 32)
            VSpace(160)
            TextInputField(entryString: $firstName, placeholderString: "firstName")
                .padding(.leading, 32)
            VSpace(38)
            TextInputField(entryString: $lastName, placeholderString: "lastName")
                .padding(.leading, 32)
            VSpace(38)
            TextInputField(entryString: $bookingReference, placeholderString: "bookingNumber")
                .padding(.leading, 32)
            Spacer()
            MainButton(title: "next") {
                hasUserDetails = claim.hasUserDetails()
            }.padding(32)
            NavigationLink(destination: PassengerContactView(), isActive: $hasUserDetails) {
                EmptyView()
            }.hidden()
        }
        .onAppear {
            Task {
                firstName = claim.firstName ?? ""
                lastName = claim.lastName ?? ""
                bookingReference = claim.bookingReference ?? ""
            }
        }
        .onChange(of: firstName) { newValue in
            claim.firstName = newValue
        }.onChange(of: lastName) { newValue in
            claim.lastName = newValue
        }.onChange(of: bookingReference) { newValue in
            claim.bookingReference = newValue
        }
    }
}

struct PassengerDataView_Previews: PreviewProvider {
    static var previews: some View {
        let claim = Claim(category: .flight(.cancelled),
                          date: Date(),
                          firstName: "SANDOR",
                          lastName: "KOLOTENKO")
        
        PassengerDataView()
            .environmentObject(claim)
    }
}
