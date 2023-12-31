import UIKit
import Extensions

protocol ForgotPasswordViewDelegate {
    func sendCodeButtonTapped()
}
//
class ForgotPasswordController: CoordinatorViewController<LoginViewModel> {
    // MARK: - View
    lazy var forgotPasswordView = ForgotPasswordView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = ForgotPasswordViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = forgotPasswordView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension ForgotPasswordController: ForgotPasswordViewDelegate {
    func sendCodeButtonTapped() {
        coordinator.push()
    }
}
//
// MARK: - Private Handlers
private extension ForgotPasswordController {
    func handlerPrivates() {
    }
}
