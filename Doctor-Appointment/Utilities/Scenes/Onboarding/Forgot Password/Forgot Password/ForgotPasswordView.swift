//
//  SplashView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import UIKit
import Extensions
import CompositionalLayoutableSection

class ForgotPasswordView: UIView {
    // MARK: IBOutlet
    //
    // MARK: - Properties
    let viewModel: ForgotPasswordViewModel
    let delegate: ForgotPasswordViewDelegate
    // MARK: Init
    init(viewModel: ForgotPasswordViewModel, delegate: ForgotPasswordViewDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(frame: .infinite)
        loadNib()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("Failed to initialize from coder")
    }
    @IBAction func sendCodeButtonTapped(_ sender: PrimaryButton) {
        delegate.sendCodeButtonTapped()
    }
}
//
// MARK: - Configurations
private extension ForgotPasswordView {
    func configureUI() {
    }
}
//
// MARK: - Actions
private extension ForgotPasswordView {
}
//
private extension ForgotPasswordView {
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
