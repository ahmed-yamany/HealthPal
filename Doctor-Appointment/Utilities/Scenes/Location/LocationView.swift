//
//  LocationView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit

class LocationView: UIView {
    // MARK: IBOutlet
    //
    // MARK: - Properties
    let viewModel: LocationViewModel
    let delegate: LocationViewDelegate
    // MARK: Init
    init(viewModel: LocationViewModel, delegate: LocationViewDelegate) {
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
private extension LocationView {
    func configureUI() {
    }
}
//
// MARK: - Actions
private extension LocationView {
}
//
private extension LocationView {
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
