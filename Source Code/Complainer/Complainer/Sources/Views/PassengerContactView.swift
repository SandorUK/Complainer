//
//  PassengerDataView.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 24/06/2022.
//
import SwiftUI

struct PassengerContactView: View {
    
    @Environment(\.services) var services
    @EnvironmentObject var claim: Claim
    
    @State var phone: String = ""
    @State var email: String = ""
    @State var hasUserContactDetails = false
    
    var body: some View {
        VStack {
            ClaimHeader("passengerContactDetails")
                .padding(.horizontal, 32)
            VSpace(160)
            TextInputField(entryString: $phone, placeholderString: "phone")
                .padding(.leading, 32)
            VSpace(38)
            TextInputField(entryString: $email, placeholderString: "email")
                .padding(.leading, 32)
            VSpace(38)
            Spacer()
            MainButton(title: "complete") {
                hasUserContactDetails = claim.hasUserContactDetails()
                claim.reset()
            }.padding(32)
        }
        .onAppear {
            Task {
                phone = claim.phone ?? ""
                email = claim.email ?? ""
            }
        }
        .onChange(of: phone) { newValue in
            claim.phone = newValue
        }.onChange(of: email) { newValue in
            claim.email = newValue
        }
    }
}

struct PassengerContactView_Previews: PreviewProvider {
    static var previews: some View {
        let claim = Claim(category: .flight(.cancelled),
                          date: Date(),
                          email: "sandor@londonappworks.co.uk",
                          phone: "+447782569060")
        PassengerContactView()
            .environmentObject(claim)
            .previewInterfaceOrientation(.portrait)
    }
}
