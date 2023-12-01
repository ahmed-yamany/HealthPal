import UIKit
import Extensions

protocol SignupViewDelegate {
    func emailTextFieldEditingChanged(_ text: String)
    func passwordTextFieldEditingChanged(_ text: String)
    func signupButtonTapped()
    func signinButtonTapped()
}
//
class SignupController: CoordinatorViewController<SignupViewModel> {
    // MARK: - View
    lazy var signupView = SignupView(delegate: self)
    //
    // MARK: - Properties
    lazy var viewModel: SignupViewModel = sharedObject // the shared object from the coordiator
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = signupView
    }
}
//
// MARK: - SignupViewDelegate
extension SignupController: SignupViewDelegate {
    func emailTextFieldEditingChanged(_ text: String) {
        viewModel.email = text
    }
    ///
    func passwordTextFieldEditingChanged(_ text: String) {
        viewModel.password = text
    }
    ///
    func signupButtonTapped() {
        if viewModel.isSignupFormValid() {
            coordinator.push()
        } else {
            AlertController.shared.preset(type: .warrning, with: L10n.Signup.Alert.warrning, dismissAfter: 2)
        }
    }
    //
    func signinButtonTapped() {
        AppCoordinator.shared.login()
    }
}
//
// MARK: - Private Handlers
private extension SignupController {
}
