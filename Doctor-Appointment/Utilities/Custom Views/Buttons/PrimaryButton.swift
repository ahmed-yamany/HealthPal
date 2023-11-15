//
//  PrimaryButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import MakeConstraints
import Extensions

open class PrimaryButton: UIButton {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder: NSCoder) {
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
        setTitleColor(.doap50, for: .normal)
        //
        configuration = nil
        titleLabel?.font = .medium
    }
}
