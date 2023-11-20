//
//  AlertType.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 20/11/2023.
//

import UIKit
import Extensions

enum AlertType {
    case success, warrning, error
    var title: String {
        switch self {
        case .success:
            L10n.Alert.success
        case .warrning:
            L10n.Alert.warrning
        case .error:
            L10n.Alert.error
        }
    }
    //
    var iconBackgoundColor: UIColor? {
        switch self {
        case .success:
                UIColor(hexString: "a4cfc3")
        case .warrning:
                .systemOrange
        case .error:
                .systemRed
        }
    }
    //
    var icon: UIImage? {
        switch self {
        case .success:
                UIImage(systemName: "checkmark.shield.fill")
        case .warrning:
            UIImage(systemName: "exclamationmark.triangle.fill")
        case .error:
            UIImage(systemName: "x.circle.fill")
        }
    }
}
