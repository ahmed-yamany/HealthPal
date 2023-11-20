//
//  SplashViewModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import Foundation
import Combine
import FirebaseAuth

// MARK: LoginViewModel
//
class LoginViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    //
    func performLogin() async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
}
