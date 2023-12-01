//
//  HomeViewModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import Foundation
import Combine

// MARK: HomeViewModel
//
class HomeViewModel {
    let offers: [OfferModel] = [
        .init(title: "Looking for Specialist Doctors?",
              subtitle: "Schedule an appointment with our top doctors.", image: "offer-1"),
        .init(title: "Looking for Specialist Doctors?",
              subtitle: "Schedule an appointment with our top doctors.", image: "offer-2"),
        .init(title: "Looking for Specialist Doctors?",
              subtitle: "Schedule an appointment with our top doctors.", image: "offer-3")
    ]
    let categories: [CategoryModel] = [
        .init(title: "Dentistry", backgroundColor: "DC9497", image: "category-1"),
        .init(title: "Cardiolo..", backgroundColor: "93C19E", image: "category-2"),
        .init(title: "Pulmono..", backgroundColor: "F5AD7E", image: "category-3"),
        .init(title: "General", backgroundColor: "ACA1CD", image: "category-4"),
        .init(title: "Neurology", backgroundColor: "4D9B91", image: "category-5"),
        .init(title: "Gastroen..", backgroundColor: "352261", image: "category-6"),
        .init(title: "Laborato..", backgroundColor: "DEB6B5", image: "category-7"),
        .init(title: "Vaccinat..", backgroundColor: "89CCDB", image: "category-8")
    ]
}
