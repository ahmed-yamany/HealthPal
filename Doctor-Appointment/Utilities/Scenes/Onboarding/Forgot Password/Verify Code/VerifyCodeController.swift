//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit

class VerifyCodeController: UIViewController {
    // MARK: - View
    lazy var verifyCodeView = VerifyCodeView(viewModel: viewModel)
    //
    // MARK: - Properties
    let viewModel = VerifyCodeViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = verifyCodeView
        handlerPrivates()
    }
}
//
// MARK: - Private Handlers
private extension VerifyCodeController {
    func handlerPrivates() {
    }
}
