//
//  LoginView.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 17/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(spacing: 32) {
                    LogoView(title: L10n.Login.Logo.title,
                             subtitle: L10n.Login.Logo.subtitle)
                    TextFieldsView(viewModel: viewModel)
                }
                //
                PrimaryButton(title: L10n.Login.button) { }
                //
                DividerView()
                //
                SocialMediaView()
                MediumButton(title: L10n.Login.forgotPassword) { }
                HStack {
                    Text(L10n.Login.Signup.label)
                        .font(.medium)
                        .foregroundStyle(.doap500)
                    MediumButton(title: L10n.Login.Signup.button) { }
                }
                Spacer()
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct TextFieldsView: View {
    @ObservedObject var viewModel = LoginViewModel()
    var body: some View {
        VStack(spacing: 20) {
            PrimaryTextField(text: $viewModel.email,
                             title: L10n.Login.TextField.email,
                             icon: .iconEmail)
            //
            PrimaryTextField(text: $viewModel.password,
                             title: L10n.Login.TextField.password,
                             icon: .iconPassword,
                             secured: true)
        }
    }
}
//
private struct DividerView: View {
    var body: some View {
        Divider()
            .background(.doap200)
            .overlay {
                Text("Or")
                    .foregroundStyle(.doap500)
                    .font(.medium)
                    .padding(.horizontal, 20)
                    .background(.doapMainBackground)
            }
    }
}
//
private struct SocialMediaView: View {
    var body: some View {
        VStack(spacing: 16) {
            SocialMediaButton(type: .google) {}
            SocialMediaButton(type: .facebook) {}
        }
    }
}

#Preview {
    LoginView()
}
