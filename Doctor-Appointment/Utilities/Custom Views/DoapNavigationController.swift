//
//  DoapNavigationController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 14/11/2023.
//

import UIKit

class DoapNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    ///
    private func configureNavigationBar() {
        let backImage = UIImage(systemName: "arrow.backward")
        //
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        //
        navigationBar.tintColor = .doapMain
        delegate = self
    }
}
///
extension DoapNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        viewController.navigationItem.backButtonTitle = ""
    }
}
