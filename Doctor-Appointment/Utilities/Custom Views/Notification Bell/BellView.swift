//
//  BellView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit
import MakeConstraints
import Extensions
import ViewAnimator

class BellView: UIView {
    // MARK: IBOutlet
    //
    @IBOutlet weak var bellImageView: UIImageView!
    @IBOutlet weak var badge: UIView!
    // MARK: Properities
    //
    var ring: Bool = false {
        didSet {
            if ring {
                badge.isHidden = false
                animateBell()
            } else {
                badge.isHidden = true
            }
        }
    }
//    // MARK: Init
//    //
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
extension BellView {
    func configureUI() {
        equalSizeConstraints(32)
        makeCircle(height: 32)
        badge.makeCircle(height: 5)
    }
    func animateBell() {
        let angle: CGFloat = .pi / 8
        let animatins: [Animation] = [
            AnimationType.rotate(angle: -angle),
            AnimationType.rotate(angle: angle),
            AnimationType.rotate(angle: -angle),
            AnimationType.rotate(angle: angle),
            AnimationType.rotate(angle: -angle),
            AnimationType.rotate(angle: angle),
            AnimationType.rotate(angle: -angle),
            AnimationType.rotate(angle: angle),
            AnimationType.rotate(angle: 0)
        ]
        bellImageView.animateKeyFrames(animations: animatins, initialAlpha: 0.7, duration: 1.2)
    }
}
//
// MARK: - Actions
private extension BellView {
}
//
extension BellView {
    /// Loads the view from a nib file and adds it as a subview to the SplashView view.
    func loadNib() {
        // Please do not update this code, as it's used to load the view from a nib.
        // swiftlint:disable all
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)![ 0] as! UIView
        addSubview(view)
        view.frame = bounds
        // swiftlint:enable all
    }
}
