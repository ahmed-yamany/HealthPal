//
//  LocationController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit

protocol LocationViewDelegate {
}
//
class LocationController: UIViewController {
    // MARK: - View
    lazy var locationView = LocationView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = LocationViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = locationView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension LocationController: LocationViewDelegate {
}
//
// MARK: - Private Handlers
private extension LocationController {
    func handlerPrivates() {
    }
}
