//
//  MediumButton.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 18/11/2023.
//

import SwiftUI

struct MediumButton: View {
    let title: String
    let action: () -> Void
    //
    var body: some View {
        Button(title) {
            action()
        }
        .font(.medium)
        .foregroundStyle(Color.blue)
    }
}

#Preview {
    MediumButton(title: "Forgot Password", action: { })
}
