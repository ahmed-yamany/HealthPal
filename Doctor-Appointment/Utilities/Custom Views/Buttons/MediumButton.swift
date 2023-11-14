//
//  MediumButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 14/11/2023.
//

import UIKit

class MediumButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    //
    private func setup() {
        setTitleColor(.systemBlue, for: .normal)
        //
        configuration = nil
        titleLabel?.font = .medium
    }
}
