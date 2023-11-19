//
//  PrimaryTestField.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 17/11/2023.
//

import SwiftUI

struct PrimaryTextField: View {
    @Binding var text: String
    let title: String
    let icon: ImageResource
    var secured: Bool = false
    var body: some View {
        HStack {
            Image(icon)
                .font(.custom(size: 18, weight: .regular))
                .foregroundStyle(.doap400)
            if secured {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
        }
        .font(.regular)
        .padding(.horizontal, 16)
        .frame(height: 44)
        .background(.doapMainBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .fill(.doap300)
        )
    }
}

#Preview {
    PrimaryTextField(text: .constant(""),
                     title: "Your Email",
                     icon: .iconEmail)
    .padding()
}
