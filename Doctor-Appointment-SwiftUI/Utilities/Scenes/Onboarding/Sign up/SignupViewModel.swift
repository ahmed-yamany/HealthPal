//
//  SignupViewModel.swift
//  Doctor-Appointment-SwiftUI
//
//  Created by Ahmed Yamany on 19/11/2023.
//

import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}
