//
//  SplashViewModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import Foundation
import Combine
import FirebaseAuth

// MARK: SignupViewModel
//
class SignupViewModel {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    ///
    public func isValidForm() -> Bool {
        !name.isEmpty && email.isValidEmail() && !password.isEmpty
    }
    ///
    public func performSignup() async throws {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let changeRequest = authResult.user.createProfileChangeRequest()
        changeRequest.displayName = name
        try await changeRequest.commitChanges()
    }
}
