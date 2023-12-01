import UIKit
import Extensions

class SignupView: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var signupButton: PrimaryButton!
    let activityIndicator = UIActivityIndicatorView()
    //
    // MARK: - Properties
    let delegate: SignupViewDelegate
    // MARK: Init
    init(delegate: SignupViewDelegate) {
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
extension SignupView {
    func startLoading() {
        activityIndicator.color = .doapMainBackground
        signupButton.show(activityIndicator)
    }
    func stopLoading() {
        activityIndicator.hide()
    }
}
//
// MARK: - Actions
private extension SignupView {
    @IBAction func emailTextFieldEditingChanged(_ sender: PrimaryTextField) {
        delegate.emailTextFieldEditingChanged(sender.text ?? "")
    }
    ///
    @IBAction func passwordTextFieldEditingChanged(_ sender: PrimaryTextField) {
        delegate.passwordTextFieldEditingChanged(sender.text ?? "")
    }
    ///
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        delegate.signupButtonTapped()
    }
    ///
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        delegate.signinButtonTapped()
    }
}
//
private extension SignupView {
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
