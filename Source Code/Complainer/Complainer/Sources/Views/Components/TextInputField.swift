//
//  TextField.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 24/06/2022.
//

import SwiftUI

struct TextInputField: View {
    
    @Binding var entryString: String
    @State var isActive: Bool = false
    
    let placeholderString: LocalizedStringKey
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(uiColor: .white))
            VStack {
                TextField(placeholderString, text: $entryString) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            isActive = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        isActive = false
                    }
                }.font(Font.custom("AnekLatin-Medium", size: 21))
                    .foregroundColor(.black)
                
                let currentColor = isActive ? UIColor.blue : UIColor.gray
                Color(uiColor: currentColor).frame(width: 300, height: 1, alignment: Alignment(horizontal: .leading, vertical: .top))
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
    }
}
