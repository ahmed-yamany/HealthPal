//
//  ProfileController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit

protocol ProfileViewDelegate {
}
//
class ProfileController: UIViewController {
    // MARK: - View
    lazy var profileView = ProfileView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = ProfileViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension ProfileController: ProfileViewDelegate {
}
//
// MARK: - Private Handlers
private extension ProfileController {
    func handlerPrivates() {
    }
}
