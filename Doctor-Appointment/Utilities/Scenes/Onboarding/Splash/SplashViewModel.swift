//
//  SplashViewModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import Foundation
import Combine

// MARK: SplashViewModel
//
class SplashViewModel {
    @Published var currentPageIndex: Int = 0
    @Published var splashes: [SplashModel] = []
    //
    var cancellableSet: Set<AnyCancellable> = []
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
    //
    func hasMorePages() -> Bool {
        currentPageIndex < splashes.count
    }
    //
    func isLastPage() -> Bool {
        !(currentPageIndex < splashes.count - 1)
    }
}
