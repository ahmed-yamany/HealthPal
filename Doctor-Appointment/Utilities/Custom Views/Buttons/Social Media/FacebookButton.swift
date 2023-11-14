//
//  FacebookButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 14/11/2023.
//

import UIKit

open class FacebookButton: SocialMediaButton {
    override func setup() {
        super.setup()
        title = L10n.SocialMedia.facebook
        icon = .iconFacebook.withRenderingMode(.alwaysOriginal)
    }
}
