//
//  SocialMediaButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 14/11/2023.
//

import UIKit
import MakeConstraints
import Extensions

open class SocialMediaButton: UIButton {
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    ///
    var icon: UIImage? {
        didSet {
            setImage(icon, for: .normal)
        }
    }
    ///
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    //
    func setup() {
        heightConstraints(44)
        layerCornerRadius = 8
        layerBorderColor = .doap200
        layerBorderWidth = 1
        //
        backgroundColor = .doapMainBackground
        setTitleColor(.doap900, for: .normal)
        //
        configuration = .none
        titleLabel?.font = .medium
        // arono what is this, deprecated in iOS 15 and works on iOS 16 and above 🙄
        imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 8)
    }
}
