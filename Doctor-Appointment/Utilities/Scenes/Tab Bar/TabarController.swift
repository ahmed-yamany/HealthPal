//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import FirebaseAuth
protocol TabarViewDelegate {
}
//
class TabarController: UIViewController {
    // MARK: - View
    lazy var tabarView = TabarView(viewModel: viewModel, delegate: self)
    //
    // MARK: - Properties
    let viewModel = TabarViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = tabarView
        handlerPrivates()
    }
}
//
// MARK: - SignupViewDelegate
extension TabarController: TabarViewDelegate {
}
//
// MARK: - Private Handlers
private extension TabarController {
    func handlerPrivates() {
    }
}
