//
//  NavigationItem.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct BlockNavigationItem<Destination: View>: View {
    let get: () -> Bool
    let set: () -> Void
    let destination: Destination

    init(get: @escaping () -> Bool, set: @escaping () -> Void, destination: Destination) {
        self.get = get
        self.set = set
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(isActive: Binding<Bool> {
            get()
        } set: { _ in
            set()
        }) {
            destination
        } label: {
            EmptyView()
        }.hidden()
    }
}

struct PropertyNavigationItem<Value, Destination: View>: View {
    let value: Binding<Value?>
    let destination: Destination

    init(value: Binding<Value?>, destination: Destination) {
        self.value = value
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(isActive: Binding<Bool> {
            value.wrappedValue != nil
        } set: { _ in
            value.wrappedValue = nil
        }) {
            destination
        } label: {
            EmptyView()
        }.hidden()
    }
}
