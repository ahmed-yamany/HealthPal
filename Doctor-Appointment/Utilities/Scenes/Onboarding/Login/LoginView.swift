import UIKit
import Extensions

class LoginView: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var signinButton: PrimaryButton!
    let activityIndicator = UIActivityIndicatorView()
    //
    // MARK: - Properties
    let viewModel: LoginViewModel
    let delegate: LoginViewDelegate
    // MARK: Init
    init(viewModel: LoginViewModel, delegate: LoginViewDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(frame: .infinite)
        loadNib()
    }
    required init?(coder: NSCoder) {
        fatalError("Failed to initialize from coder")
    }
}
//
// MARK: - Configurations
extension LoginView {
    func startLoading() {
        signinButton.show(activityIndicator)
        activityIndicator.color = .doapMainBackground
    }
    func stopLoading() {
        activityIndicator.hide()
    }
}
//
// MARK: - Actions
private extension LoginView {
    @IBAction func emailEditingChanged(_ sender: PrimaryTextField) {
        viewModel.email = sender.text ?? ""
    }
    ///
    @IBAction func passwordEditingChanged(_ sender: PrimaryTextField) {
        viewModel.password = sender.text ?? ""
    }
    ///
    @IBAction func signinButtonTapped(_ sender: PrimaryButton) {
        delegate.signinButtonTapped()
    }
    ///
    @IBAction func forgotPasswordTapped(_ sender: MediumButton) {
        delegate.forgotPasswordTapped()
    }
    ///
    @IBAction func signupButtonTapped(_ sender: MediumButton) {
        delegate.signupButtonTapped()
    }
}
//
private extension LoginView {
    /// Loads the view from a nib file and adds it as a subview to the SplashView view.
    func loadNib() {
        // Please do not update this code, as it's used to load the view from a nib.
        // swiftlint:disable all
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)![0] as! UIView
        addSubview(view)
        view.frame = bounds
        // swiftlint:enable all
    }
}
