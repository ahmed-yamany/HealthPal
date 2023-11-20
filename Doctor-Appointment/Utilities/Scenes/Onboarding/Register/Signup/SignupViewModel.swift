//
//  SplashViewModel.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import Foundation
import Combine

// MARK: SignupViewModel
//
class SignupViewModel {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}
