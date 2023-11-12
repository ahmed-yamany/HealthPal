//
//  RegularButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//
import UIKit

class RegularButton: UIButton {
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
        setTitleColor(.doap5006B7280, for: .normal)
        //
        configuration = nil
        titleLabel?.font = .regular
    }
}
