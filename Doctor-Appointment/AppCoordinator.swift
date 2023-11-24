//
//  AppCoordinator.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 13/11/2023.
//

import UIKit
import Extensions
import FirebaseAuth

final class AppCoordinator {
    public static let shared = AppCoordinator()
    public var window: UIWindow? = UIApplication.shared.mainWindow
    ///
    private init() {}
    ///
    public func checkLogin() {
        guard let window else {
            Logger.log("Failed to wrap main window", category: \.default, level: .fault)
            return
        }
        //
        if Auth.auth().currentUser != nil {
            window.rootViewController = TabBarViewController()
        } else {
            window.rootViewController = SplashController()
        }
    }
    ///
    public func login() {
        let coordinator = Coordinator<LoginViewModel>(navigationControllerType: DoapNavigationController.self,
                                                      sharedObject: LoginViewModel())
        //
        coordinator.setCoordinatorTypes([LoginController.self, ForgotPasswordController.self,
                                         VerifyCodeController.self, NewPasswordController.self])
        window?.rootViewController = coordinator.navigationController
    }
    ///
    public func register() {
        let coordinator = Coordinator<SignupViewModel>(navigationControllerType: DoapNavigationController.self,
                                                       sharedObject: SignupViewModel())
        //
        coordinator.setCoordinatorTypes([SignupController.self, CreateProfileController.self])
        window?.rootViewController = coordinator.navigationController
    }
}
