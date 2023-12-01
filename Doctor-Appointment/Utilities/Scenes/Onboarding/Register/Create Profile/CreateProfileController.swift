import UIKit
import Extensions

protocol CreateProfileViewDelegate {
    func nameTextFieldEditingChanged(_ text: String)
    func nickNameTextFieldEditingChanged(_ text: String)
    func dataTextFieldEditingDidEnd(_ text: String)
    func genderTextFieldEditingDidEnd(_ text: String)
    func saveButtonTapped()
}
//
class CreateProfileController: CoordinatorViewController<SignupViewModel> {
    // MARK: - View
    lazy var createProfileView = CreateProfileView(delegate: self)
    //
    // MARK: - Properties
    lazy var viewModel: SignupViewModel = sharedObject // the shared object from the coordiator
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = createProfileView
        configureUI()
    }
}
//
private extension CreateProfileController {
    func configureUI() {
        navigationItem.setTitle(L10n.Profile.title)

    }
}
// MARK: - SignupViewDelegate
extension CreateProfileController: CreateProfileViewDelegate {
    func nameTextFieldEditingChanged(_ text: String) {
        viewModel.name = text
    }
    func nickNameTextFieldEditingChanged(_ text: String) {
        viewModel.nickName = text
    }
    func dataTextFieldEditingDidEnd(_ text: String) {
        viewModel.date = text
    }
    func genderTextFieldEditingDidEnd(_ text: String) {
        viewModel.gender = text
    }
    func saveButtonTapped() {
        if viewModel.isProfileFormValid() {
            performSignup()
        } else {
            AlertController.shared.preset(type: .warrning, with: L10n.Signup.Alert.warrning, dismissAfter: 2)
        }
    }
}
// MARK: - Private Handlers
private extension CreateProfileController {
    func performSignup() {
        createProfileView.startLoading()
        Task {
            do {
                try await viewModel.performSignup()
                onSuccessSignup()
            } catch {
                showSignupError(error)
            }
            createProfileView.stopLoading()
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
