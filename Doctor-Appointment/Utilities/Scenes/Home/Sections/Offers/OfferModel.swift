//
//  OfferModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 27/11/2023.
//

import UIKit

struct OfferModel: Codable {
    let title: String
    let subtitle: String
    let image: String // assets name
    var uiImage: UIImage? {
        UIImage(named: image)
    }
}
