//
//  SplashView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import UIKit
import Extensions
import CompositionalLayoutableSection

class AlertView: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    //
    // MARK: - Properties
    let delegate: AlertViewDelegate
    // MARK: Init
    init(delegate: AlertViewDelegate) {
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
extension AlertView {
    func configure(with type: AlertType) {
        backgroundColor = .doapMain.withAlphaComponent(0.1)
        imageBackgroundView.backgroundColor = type.iconBackgoundColor
        imageView.image = type.icon
        titleLabel.text = type.title
    }
}
//
// MARK: - Actions
private extension AlertView {
}
//
private extension AlertView {
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
