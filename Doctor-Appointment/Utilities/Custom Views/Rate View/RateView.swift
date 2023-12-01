//
//  RateView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 28/11/2023.
//

import UIKit

protocol RateViewDelegate: NSObjectProtocol {
}
//
class RateView: UIView {
    // MARK: Views
    let starsStackView: UIStackView = UIStackView()
    let start: [UIButton] = []
    //
    // MARK: Properities
    //
    weak var delegate: RateViewDelegate?
    // MARK: Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
}
//
// MARK: - Configurations
private extension RateView {
    func configureUI() {
        configureStartStackView()
        configureStars()
    }
    func configureStartStackView() {
        starsStackView.axis = .horizontal
        starsStackView.alignment = .center
        starsStackView.distribution = .equalSpacing
        addSubview(starsStackView)
        starsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starsStackView.topAnchor.constraint(equalTo: topAnchor),
            starsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            starsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    func configureStars() {
        for index in 0...4 {
            let starButton = createStarButton(at: index)
            starsStackView.addArrangedSubview(starButton)
        }
    }
    func createStarButton(at index: Int) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tag = index
        button.tintColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 10),
            button.widthAnchor.constraint(equalToConstant: 10)
        ])
        return button
    }
}
//
// MARK: - Actions
private extension RateView {
}
