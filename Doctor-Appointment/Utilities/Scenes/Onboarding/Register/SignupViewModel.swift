import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

// MARK: SignupViewModel
//
class SignupViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    //
    @Published var name: String = ""
    @Published var nickName: String = ""
    @Published var date: String = ""
    @Published var gender: String = ""
    ///
    public func isSignupFormValid() -> Bool {
        email.isValidEmail() && !password.isEmpty
    }
    public func isProfileFormValid() -> Bool {
        !name.isEmpty && !nickName.isEmpty && !date.isEmpty && !gender.isEmpty
    }
    ///
    public func performSignup() async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
}
