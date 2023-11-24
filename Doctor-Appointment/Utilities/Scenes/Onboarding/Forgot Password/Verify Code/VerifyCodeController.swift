import UIKit
import Extensions

protocol VerifyCodeViewDelegate {
    func verifyButtonTapped()
}
//
class VerifyCodeController: CoordinatorViewController<LoginViewModel> {
    // MARK: - View
    lazy var verifyCodeView = VerifyCodeView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = VerifyCodeViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = verifyCodeView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension VerifyCodeController: VerifyCodeViewDelegate {
    func verifyButtonTapped() {
        coordinator.push()
    }
}
//
// MARK: - Private Handlers
private extension VerifyCodeController {
    func handlerPrivates() {
    }
}
