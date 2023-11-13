//
//  SplashView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import UIKit
import Extensions
import CompositionalLayoutableSection

class LoginView: UIView {
    // MARK: IBOutlet
    //
    // MARK: - Properties
    let viewModel: LoginViewModel
    // MARK: Init
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
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
private extension LoginView {
    func configureUI() {
    }
}
//
// MARK: - Actions
private extension LoginView {
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
