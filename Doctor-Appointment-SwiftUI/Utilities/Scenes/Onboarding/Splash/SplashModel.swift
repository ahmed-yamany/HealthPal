//
//  SplashModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit

struct SplashModel: Codable, Identifiable, Hashable {
    var id = UUID()
    let image: String
    let title: String
    let subTitle: String
    ///
    var uiImage: UIImage? {
        UIImage(named: image)
    }
}
