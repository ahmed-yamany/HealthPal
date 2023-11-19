//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import Extensions

class NewPasswordController: CoordinatorViewController<FortgotPasswordViewModel> {
    // MARK: - View
    lazy var newPasswordView = NewPasswordView(viewModel: viewModel)
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
// MARK: - Private Handlers
private extension NewPasswordController {
    func handlerPrivates() {
    }
}
