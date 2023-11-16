//
//  NormalButton.swift
//  Doctor-Appointment-swiftui
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import SwiftUI

struct NormalButton: View {
    let title: String
    let action: () -> Void
    //
    var body: some View {
        Button(title) {
            action()
        }
        .font(.regular)
        .foregroundStyle(.doap500)
    }
}

#Preview {
    NormalButton(title: "Skip", action: {})
}
