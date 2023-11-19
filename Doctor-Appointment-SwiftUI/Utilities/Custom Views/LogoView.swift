//
//  LogoView.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 17/11/2023.
//

import SwiftUI

struct LogoView: View {
    let title: String
    let subtitle: String
    var body: some View {
        VStack(spacing: 48) {
            Image(.appLogo)
            VStack(spacing: 8) {
                Text(title)
                    .foregroundStyle(Color.doapMain)
                    .font(.h2)
                Text(subtitle)
                    .foregroundStyle(.doap500)
                    .font(.medium)
            }
        }
    }
}

#Preview {
    LogoView(title: "Hi, Welcome Back!",
             subtitle: "Hope you're doing fine.")
}
