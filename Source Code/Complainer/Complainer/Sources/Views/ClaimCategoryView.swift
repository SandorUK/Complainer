//
//  ClaimCategoryView.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct ClaimCategoryView: View {
    
    @Environment(\.services) var services
    @EnvironmentObject var claim: Claim
    
    var body: some View {
        VStack {
            PilotHeader()
                .padding(.horizontal, 32)
            List {
                Section(header: ListHeader(icon: UIImage(named: "airplane"), title: "flight")) {
                    ForEach(Claim.Category.Flight.allCases) { value in
                        Button {
                            claim.category = .flight(value)
                        } label: {
                            Label(value.title, size: 17, style: .medium)
                                .foregroundColor(.black)
                        }
                    }
                }
                Section(header: ListHeader(icon: UIImage(named: "luggage"), title: "luggage")) {
                    ForEach(Claim.Category.Luggage.allCases) { value in
                        Button {
                            claim.category = .luggage(value)
                        } label: {
                            Label(value.title, size: 17, style: .medium)
                                .foregroundColor(.black)
                        }
                    }
                }
            }            
            PropertyNavigationItem(value: $claim.category, destination: FlightDateView())
        }
    }
}

extension ClaimCategoryView {
    
    struct ListHeader: View {
        let icon: UIImage?
        let title: LocalizedStringKey

        var body: some View {
            HStack {
                Image(uiImage: icon ?? UIImage())
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(uiColor: .systemRed))
                    .frame(width: 24)
                    .padding(.trailing)
                Label(title, size: 20)
                    .foregroundColor(.black)
            }
            .frame(height: 44)
        }
    }
}

struct ClaimCategoryView_Previews: PreviewProvider {
    static var previews: some View {        
        ClaimCategoryView()
            .environmentObject(Claim())
    }
}
