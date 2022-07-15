//
//  MainButton.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import SwiftUI

struct MainButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(LocalizedStringKey(title))
                    .font(Font.custom("AnekLatin-SemiBold", size: 18))
                Spacer()
            }
        }
        .contentShape(Rectangle())
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .systemBlue))
        .cornerRadius(12)
        .foregroundColor(.white)
    }
}
