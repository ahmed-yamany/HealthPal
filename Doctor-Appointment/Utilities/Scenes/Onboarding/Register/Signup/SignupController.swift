//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import Extensions

protocol SignupViewDelegate {
    func signupButtonTapped()
}
//
class SignupController: CoordinatorViewController {
    // MARK: - View
    lazy var signupView = SignupView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = SignupViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = signupView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension SignupController: SignupViewDelegate {
    func signupButtonTapped() {
        coordinator.push()
    }
}
//
// MARK: - Private Handlers
private extension SignupController {
    func handlerPrivates() {
    }
}
