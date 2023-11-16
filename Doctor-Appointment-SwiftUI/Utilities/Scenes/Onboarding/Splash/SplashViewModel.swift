//
//  SplashViewModel.swift
//  Doctor-Appointment-swiftui
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var selectedPage: Int = 0
    @Published var skip: Bool = false
    @Published var splashes: [SplashModel] = []
    //
    public func getSplashes() async throws -> [SplashModel] {
        return [
            // swiftlint: disable all
            .init(image: "splash-1", title: "Meet Doctors Online", subTitle: "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations."),
            .init(image: "splash-2", title: "Connect with Specialists", subTitle: "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations."),
            .init(image: "splash-3", title: "Thousands of Online Specialists", subTitle: " Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.")
            // swiftlint: enable all
        ]
    }
    public func move() {
        if selectedPage < splashes.count - 1 {
            selectedPage += 1
        } else {
            skip = true
        }
    }
}
