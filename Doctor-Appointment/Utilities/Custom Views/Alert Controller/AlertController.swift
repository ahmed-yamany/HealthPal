//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import Extensions

protocol AlertViewDelegate {
}
//
class AlertController: UIViewController {
    // MARK: - View
    lazy var alertView = AlertView(delegate: self)
    //
    // MARK: - Properties
    public static var shared = AlertController()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = alertView
        handlerPrivates()
    }
    //
    public func preset(type: AlertType,
                       with string: String,
                       dismissAfter time: Double = 1, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.async { [unowned self] in
            guard let topMostViewController = UIApplication.shared.topMostViewController() else {
                Logger.log("Failed to get topMostViewController", category: \.default, level: .fault)
                return
            }
            ///
            self.modalPresentationStyle = .overFullScreen
            alertView.configure(with: type)
            alertView.subtitleLabel.text = string
            ///
            topMostViewController.present(self, animated: true)
            ///
            DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                self.dismiss(animated: true, completion: completion)
            }
        }
    }
}
//
// MARK: - SignupViewDelegate
extension AlertController: AlertViewDelegate {
}
//
// MARK: - Private Handlers
private extension AlertController {
    func handlerPrivates() {
    }
}
