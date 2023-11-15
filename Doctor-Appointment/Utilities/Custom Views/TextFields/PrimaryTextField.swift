//
//  PrimaryTextField.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 13/11/2023.
//

import UIKit
import MakeConstraints
import Extensions

@IBDesignable
class PrimaryTextField: UITextField {
    // MARK: Properities
    @IBInspectable
    var icon: UIImage? {
        didSet {
            if icon == nil {
                addPaddingLeft(20)
            } else {
                addPaddingLeftIcon(icon, padding: 20, tintColor: .doap400)
            }
        }
    }
    @IBInspectable
    var righIcon: UIImage? {
        didSet {
            if righIcon != nil {
                addPaddingRightIcon(righIcon, padding: 20, tintColor: .doap400)
            }
        }
    }
    //
    // MARK: Init
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
private extension PrimaryTextField {
    func configureUI() {
        borderStyle = .none
        backgroundColor = .doapMainBackground
        heightConstraints(44)
        layerCornerRadius = 8
        layerBorderColor = .doap300
        layerBorderWidth = 1
    }
}
