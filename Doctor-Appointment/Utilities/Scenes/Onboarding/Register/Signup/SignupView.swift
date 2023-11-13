//
//  SplashView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import UIKit
import Extensions
import CompositionalLayoutableSection

class SignupView: UIView {
    // MARK: IBOutlet
    //
    // MARK: - Properties
    let viewModel: SignupViewModel
    let delegate: SignupViewDelegate
    // MARK: Init
    init(viewModel: SignupViewModel, delegate: SignupViewDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(frame: .infinite)
        loadNib()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("Failed to initialize from coder")
    }
    @IBAction func buttonTapped(_ sender: Any) {
        delegate.signupButtonTapped()
    }
}
//
// MARK: - Configurations
private extension SignupView {
    func configureUI() {
    }
}
//
// MARK: - Actions
private extension SignupView {
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
