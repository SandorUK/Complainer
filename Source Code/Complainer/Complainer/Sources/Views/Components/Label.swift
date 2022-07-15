//
//  Label.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct Label: View {
    let value: LocalizedStringKey
    let size: CGFloat
    let style: Style
    
    enum Style: String {
        case thin = "Thin"
        case light = "Light"
        case regular = "Eegular"
        case medium = "Medium"
        case semiBold = "SemiBold"
    }
    
    init(_ value: LocalizedStringKey, size: CGFloat = 18, style: Style = .semiBold) {
        self.value = value
        self.size = size
        self.style = style
    }
    
    init(_ value: String, size: CGFloat = 18, style: Style = .semiBold) {
        self.value = .init(value)
        self.size = size
        self.style = style
    }
    
    var body: some View {
        Text(value)
            .font(Font.custom("AnekLatin-\(style.rawValue)", size: size))
    }
}
