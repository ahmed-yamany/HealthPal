import UIKit
import Extensions

protocol SignupViewDelegate {
    func signupButtonTapped()
    func signinButtonTapped()
}
//
class SignupController: CoordinatorViewController<SignupViewModel> {
    // MARK: - View
    lazy var signupView = SignupView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = SignupViewModel()
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
    func signupButtonTapped() {
        if viewModel.isValidForm() {
            performSignup()
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
    func performSignup() {
        signupView.startLoading()
        Task {
            do {
                try await viewModel.performSignup()
                onSuccessSignup()
            } catch {
                showSignupError(error)
            }
            signupView.stopLoading()
        }
    }
    ///
    func onSuccessSignup() {
        AlertController.shared.preset(type: .success, with: L10n.Signup.Alert.success, dismissAfter: 3.0) {
            AppCoordinator.shared.checkLogin()
        }
        Logger.log("Signup done", category: \.default, level: .info)
    }
    ///
    func showSignupError(_ error: Error) {
        AlertController.shared.preset(type: .error, with: error.localizedDescription, dismissAfter: 3.0)
    }
}
