//
//  LogoView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 13/11/2023.
//

import UIKit
import Extensions
protocol LogoViewDelegate: NSObjectProtocol {
}
//
@IBDesignable
class LogoView: UIView {
    // MARK: IBOutlet
    //
    @IBOutlet weak var titleLabel: H3Label!
    @IBOutlet weak var subtitleLabel: MediumLabel!
    // MARK: Properities
    //
    weak var delegate: LogoViewDelegate?
    //
    @IBInspectable private var titleLocalize: String = "" {
        didSet {
            titleLabel.localize = titleLocalize
        }
    }
    @IBInspectable private var subtitleLocalize: String = "" {
        didSet {
            subtitleLabel.localize = subtitleLocalize
        }
    }
    // MARK: Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
}
//
// MARK: - Configurations
private extension LogoView {
    func configureUI() {
    }
}
//
// MARK: - Actions
private extension LogoView {
}
//
private extension LogoView {
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
