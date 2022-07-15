//
//  AirportRow.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct AirportRow: View {
    let value: Airport
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Label(value.code, size: 20)
                    .foregroundColor(.black)
                VSpace(8)
                Label(value.name, size: 14)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Label(value.city, size: 20)
                    .foregroundColor(.black)
                VSpace(8)
                Label(value.country, size: 14)
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 66)
    }
}
