//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import Extensions

protocol NewPasswordViewDelegate {
}
//
class NewPasswordController: CoordinatorViewController<LoginViewModel> {
    // MARK: - View
    lazy var newPasswordView = NewPasswordView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = NewPasswordViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = newPasswordView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension NewPasswordController: NewPasswordViewDelegate {
}
//
// MARK: - Private Handlers
private extension NewPasswordController {
    func handlerPrivates() {
    }
}
