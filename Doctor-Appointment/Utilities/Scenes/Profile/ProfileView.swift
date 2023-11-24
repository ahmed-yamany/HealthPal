//
//  ProfileView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit

class ProfileView: UIView {
    // MARK: IBOutlet
    //
    // MARK: - Properties
    let viewModel: ProfileViewModel
    let delegate: ProfileViewDelegate
    // MARK: Init
    init(viewModel: ProfileViewModel, delegate: ProfileViewDelegate) {
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
private extension ProfileView {
    func configureUI() {
    }
}
//
// MARK: - Actions
private extension ProfileView {
}
//
private extension ProfileView {
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
