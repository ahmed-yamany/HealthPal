//
//  GoogleButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 14/11/2023.
//

import UIKit

open class GoogleButton: SocialMediaButton {
    override func setup() {
        super.setup()
        title = L10n.SocialMedia.google
        icon = .iconGoogle.withRenderingMode(.alwaysOriginal)
    }
}
