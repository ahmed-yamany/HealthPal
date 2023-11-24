//
//  HomeLocationView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 22/11/2023.
//

import UIKit

class HomeLocationView: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var locationLabel: H3Label!
    //
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configureUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configureUI()
    }
}
//
// MARK: - Configurations
private extension HomeLocationView {
    func configureUI() {
        locationLabel.text = "Seattle, USA"
    }
}
//
// MARK: - Actions
private extension HomeLocationView {
}
//
private extension HomeLocationView {
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
