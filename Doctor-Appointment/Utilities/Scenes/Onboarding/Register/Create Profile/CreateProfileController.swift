import UIKit
import Extensions

protocol CreateProfileViewDelegate {
    func saveButtonTapped()
}
//
class CreateProfileController: CoordinatorViewController<SignupViewModel> {
    // MARK: - View
    lazy var createProfileView = CreateProfileView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = CreateProfileViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = createProfileView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension CreateProfileController: CreateProfileViewDelegate {
    func saveButtonTapped() {
        coordinator.push()
    }
}
//
// MARK: - Private Handlers
private extension CreateProfileController {
    func handlerPrivates() {
        navigationItem.setTitle(L10n.Profile.title)
    }
}
