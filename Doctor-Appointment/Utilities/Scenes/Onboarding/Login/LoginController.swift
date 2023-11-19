//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import Extensions

protocol LoginViewDelegate {
    func signinButtonTapped()
    func forgotPasswordTapped()
    func signupButtonTapped()
}
//
class LoginController: CoordinatorViewController<LoginViewModel> {
    // MARK: - View
    lazy var loginView = LoginView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = LoginViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension LoginController: LoginViewDelegate {
    func signinButtonTapped() {
    }
    //
    func forgotPasswordTapped() {
    }
    //
    func signupButtonTapped() {
        AppCoordinator.shared.register()
    }
}
//
// MARK: - Private Handlers
private extension LoginController {
    func handlerPrivates() {
    }
}
