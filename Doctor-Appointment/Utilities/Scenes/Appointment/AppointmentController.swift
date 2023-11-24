//
//  AppointmentController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit

protocol AppointmentViewDelegate {
}
//
class AppointmentController: UIViewController {
    // MARK: - View
    lazy var appointmentView = AppointmentView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = AppointmentViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = appointmentView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension AppointmentController: AppointmentViewDelegate {
}
//
// MARK: - Private Handlers
private extension AppointmentController {
    func handlerPrivates() {
    }
}
