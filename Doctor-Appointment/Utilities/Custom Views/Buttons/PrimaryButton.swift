//
//  PrimaryButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import MakeConstraints
import Extensions

class PrimaryButton: UIButton {
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
        let height = 48 as CGFloat
        //
        heightConstraints(height)
        layerCornerRadius = height / 2
        //
        backgroundColor = .doapMain
        setTitleColor(.doap50F9FAFB, for: .normal)
        //
        configuration = nil
        titleLabel?.font = .medium
    }
}
