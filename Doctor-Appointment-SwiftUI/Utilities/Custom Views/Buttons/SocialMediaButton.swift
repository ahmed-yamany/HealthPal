//
//  SocialMedia.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 18/11/2023.
//

import SwiftUI

struct SocialMediaButton: View {
    enum SocialMediaType {
        case google, facebook
        var icon: ImageResource {
            switch self {
            case .google: ImageResource.iconGoogle
            case .facebook: ImageResource.iconFacebook
            }
        }
        var title: String {
            switch self {
            case .google: L10n.SocialMedia.google
            case .facebook: L10n.SocialMedia.facebook
            }
        }
    }
    let type: SocialMediaType
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                Image(type.icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(type.title)
                    .font(.medium)
                    .foregroundStyle(.doapMain)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .background(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1).fill(.doap200))
        }
    }
}

#Preview {
    SocialMediaButton(type: .facebook, action: { })
        .padding()
}
