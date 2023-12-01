import UIKit
import Extensions

class CreateProfileView: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var saveButton: PrimaryButton!
    let activityIndicator = UIActivityIndicatorView()
    //
    // MARK: - Properties
    let delegate: CreateProfileViewDelegate
    // MARK: Init
    init(delegate: CreateProfileViewDelegate) {
        self.delegate = delegate
        super.init(frame: .infinite)
        loadNib()
    }
    required init?(coder: NSCoder) {
        fatalError("Failed to initialize from coder")
    }
  
}
// MARK: - Configurations
extension CreateProfileView {
    func startLoading() {
        activityIndicator.color = .doapMainBackground
        saveButton.show(activityIndicator)
    }
    func stopLoading() {
        activityIndicator.hide()
    }
}
//
// MARK: - Actions
private extension CreateProfileView {
    @IBAction func saveButtonTapped(_ sender: PrimaryButton) {
        delegate.saveButtonTapped()
    }
    @IBAction func nameTextFieldEditingChanged(_ sender: PrimaryTextField) {
        delegate.nameTextFieldEditingChanged(sender.text ?? "")
    }
    @IBAction func nickNameTextFieldEditingChanged(_ sender: PrimaryTextField) {
        delegate.nickNameTextFieldEditingChanged(sender.text ?? "")
    }
    @IBAction func dateTextFieldEditingDidEnd(_ sender: DateTextField) {
        delegate.dataTextFieldEditingDidEnd(sender.text ?? "")
    }
    @IBAction func genderTextFieldEditingDidEnd(_ sender: GenderTextField) {
        delegate.genderTextFieldEditingDidEnd(sender.text ?? "")
    }
}
//
private extension CreateProfileView {
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
