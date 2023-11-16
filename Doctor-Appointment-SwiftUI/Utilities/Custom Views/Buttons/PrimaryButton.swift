//
//  PrimaryButton.swift
//  Doctor-Appointment-swiftui
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    let height: CGFloat = 44
    //
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.medium)
                .frame(height: height)
                .frame(maxWidth: .infinity)
                .background(.doapMain)
                .foregroundStyle(.doap50)
                .clipShape(RoundedRectangle(cornerRadius: height / 2))
        }
    }
}

#Preview {
    PrimaryButton(title: "Next", action: {})
}
