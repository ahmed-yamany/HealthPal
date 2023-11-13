//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import Extensions

class LoginController: CoordinatorViewController {
    // MARK: - View
    lazy var loginView = LoginView(viewModel: viewModel)
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
// MARK: - Private Handlers
private extension LoginController {
    func handlerPrivates() {
    }
}
