//
//  CategoryModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 27/11/2023.
//

import UIKit
import Extensions

struct CategoryModel: Codable {
    let title: String
    let backgroundColor: String // hexa code
    let image: String // assets name
    var uiBackgroundColor: UIColor? {
        UIColor(hexString: backgroundColor)
    }
    var uiImage: UIImage? {
        UIImage(named: image)
    }
}
