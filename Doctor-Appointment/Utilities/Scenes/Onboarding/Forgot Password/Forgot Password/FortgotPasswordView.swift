//
//  SplashView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import UIKit
import Extensions
import CompositionalLayoutableSection

class FortgotPasswordView: UIView {
    // MARK: IBOutlet
    //
    // MARK: - Properties
    let viewModel: FortgotPasswordViewModel
    // MARK: Init
    init(viewModel: FortgotPasswordViewModel) {
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
private extension FortgotPasswordView {
    func configureUI() {
    }
}
//
// MARK: - Actions
private extension FortgotPasswordView {
}
//
private extension FortgotPasswordView {
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
