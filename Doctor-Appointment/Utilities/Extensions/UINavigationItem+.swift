//
//  UINavigationItem+.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 14/11/2023.
//

import UIKit

extension UINavigationItem {
    func setTitle(_ title: String) {
        addTitleLabel(with: title, color: .doapMain, font: .h3)
    }
}
