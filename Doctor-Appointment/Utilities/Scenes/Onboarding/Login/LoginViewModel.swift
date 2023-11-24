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
