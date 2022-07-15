//
//  EntryView.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import SwiftUI

struct EntryView: View {
    
    @Environment(\.services) var services
    @EnvironmentObject var claim: Claim
    
    var body: some View {
        VStack {
            Spacer()
            Image("pilot")
                .padding(.bottom, 48)
            Label("howToUse")
                .padding(.horizontal, 32)
            Spacer()
            MainButton(title: "start") {
                claim.didStart = true
            }
            NavigationLink(destination: ClaimCategoryView(), isActive: $claim.didStart) {
                EmptyView()
            }.hidden()
        }
        .padding(32)
        .multilineTextAlignment(.center)
        .navigationBarHidden(true)
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
            .environmentObject(Claim())
    }
}
