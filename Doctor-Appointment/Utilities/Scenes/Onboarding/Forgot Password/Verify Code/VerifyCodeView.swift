//
//  SplashView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import UIKit
import Extensions
import CompositionalLayoutableSection

class VerifyCodeView: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var otpTextField: OTPTextField!
    //
    // MARK: - Properties
    let viewModel: VerifyCodeViewModel
    let delegate: VerifyCodeViewDelegate
    // MARK: Init
    init(viewModel: VerifyCodeViewModel, delegate: VerifyCodeViewDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(frame: .infinite)
        loadNib()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("Failed to initialize from coder")
    }
}
//
// MARK: - Configurations
private extension VerifyCodeView {
    func configureUI() {
        otpTextField.dataSource = self
        otpTextField.slotCount = 5
    }
}
//
// MARK: - Actions
private extension VerifyCodeView {
    @IBAction func verifyButtonTapped(_ sender: PrimaryButton) {
        delegate.verifyButtonTapped()
    }
}
// MARK: - OTPTextFieldDataSource
extension VerifyCodeView: OTPTextFieldDataSource {
    func createDigitLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .doap200
        label.layerCornerRadius = 12
        label.textAlignment = .center
        label.font = .medium
        return label
    }
}
//
private extension VerifyCodeView {
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
