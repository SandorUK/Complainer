//
//  Header.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 24..
//

import SwiftUI

struct Header<Content: View>: View {
    let title: LocalizedStringKey
    let content: Content

    init(_ title: LocalizedStringKey, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
                .frame(height: 56)
            LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .leading, endPoint: .trailing)
                .frame(height: 1)
                .opacity(0.5)
                .frame(width: 200)
            Spacer()
                .frame(height: 24)
            HStack {
                Label(title, size: 24)
                Spacer()
            }
        }
    }
}

struct PilotHeader: View {

    var body: some View {
        Header("whatHappened") {
            HStack {
                Image("pilot")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 6)
                Spacer()
            }
        }
    }
}

struct ClaimHeader: View {
    let title: LocalizedStringKey

    @EnvironmentObject var claim: Claim

    init(_ title: LocalizedStringKey) {
        self.title = title
    }

    var body: some View {
        Header(title) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Label(claim.category?.title ?? "", size: 20)
                    Label(claim.category?.subTitle ?? "", size: 14)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(uiImage: claim.category?.icon ?? UIImage())
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(uiColor: .systemRed))
                    .padding(.vertical)
                    

            }
        }
    }
}







