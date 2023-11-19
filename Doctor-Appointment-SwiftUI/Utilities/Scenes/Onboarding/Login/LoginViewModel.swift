//
//  LoginViewModel.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 17/11/2023.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
