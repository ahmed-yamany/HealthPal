//
//  SignupView.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 19/11/2023.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(spacing: 32) {
                    LogoView(title: L10n.Signup.Logo.title,
                             subtitle: L10n.Signup.Logo.subtitle)
                }
                //
                TextFieldsView(viewModel: viewModel)
                //
                PrimaryButton(title: L10n.Signup.button) { }
                //
                DividerView()
                //
                SocialMediaView()
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
//
private struct TextFieldsView: View {
    @ObservedObject var viewModel: SignupViewModel
    var body: some View {
        VStack(spacing: 20) {
            PrimaryTextField(text: $viewModel.name,
                             title: L10n.Signup.TextField.name,
                             icon: .iconUser)
            //
            PrimaryTextField(text: $viewModel.email,
                             title: L10n.Signup.TextField.email,
                             icon: .iconEmail)
            //
            PrimaryTextField(text: $viewModel.password,
                             title: L10n.Signup.TextField.password,
                             icon: .iconPassword)
        }
    }
}
//
#Preview {
    SignupView()
}
