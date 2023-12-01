//
//  CollectionReusableView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 27/11/2023.
//

import UIKit
import Extensions

protocol CollectionReusableViewDelegate: NSObjectProtocol {
    func seeAllButtonTapped()
    func getTitle(for reusableView: UICollectionReusableView) -> String
}
//
class CollectionReusableView: UICollectionReusableView {
    // MARK: IBOutlet
    @IBOutlet weak var titleLabel: H3Label!
    //
    // MARK: Properities
    //
    weak var delegate: CollectionReusableViewDelegate?
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
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
}
//
// MARK: - Configurations
private extension CollectionReusableView {
    func configureUI() {
        guard let delegate else {
            Logger.log("Failed to wrape CollectionReusableView's delegate", category: \.default, level: .fault)
            return
        }
        let title = delegate.getTitle(for: self)
        titleLabel.text = title
    }
}
//
// MARK: - Actions
private extension CollectionReusableView {
    @IBAction func seeAllButtonTapped(_ sender: MediumButton) {
        guard let delegate else {
            Logger.log("Failed to wrape CollectionReusableView's delegate", category: \.default, level: .fault)
            return
        }
        delegate.seeAllButtonTapped()
    }
}
//
private extension CollectionReusableView {
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
