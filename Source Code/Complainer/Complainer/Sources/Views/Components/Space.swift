//
//  Space.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct VSpace: View {
    let size: CGFloat
    
    init(_ size: CGFloat = 8) {
        self.size = size
    }
    
    var body: some View {
        Spacer()
            .frame(height: size)
    }
}

struct HSpace: View {
    let size: CGFloat
    
    init(_ size: CGFloat = 8) {
        self.size = size
    }
    
    var body: some View {
        Spacer()
            .frame(width: size)
    }
}
