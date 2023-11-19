//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import Extensions

class FortgotPasswordController: CoordinatorViewController<FortgotPasswordViewModel> {
    // MARK: - View
    lazy var fortgotPasswordView = FortgotPasswordView(viewModel: viewModel)
    //
    // MARK: - Properties
    let viewModel = FortgotPasswordViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = fortgotPasswordView
        handlerPrivates()
    }
}
//
// MARK: - Private Handlers
private extension FortgotPasswordController {
    func handlerPrivates() {
    }
}
