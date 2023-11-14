//
//  AppCoordinator.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 13/11/2023.
//

import UIKit
import Extensions

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
        let login = 5 < 3
        if login {
        } else {
            window.rootViewController = SplashController()
        }
    }
    ///
    public func login() {
        let coordinator = Coordinator(navigationControllerType: DoapNavigationController.self)
        //
        coordinator.setCoordinatorTypes([LoginController.self])
        //
        window?.rootViewController = coordinator.navigationController
    }
    ///
    public func register() {
        let coordinator = Coordinator(navigationControllerType: DoapNavigationController.self)
        //
        coordinator.setCoordinatorTypes([SignupController.self, CreateProfileController.self])
        //
        window?.rootViewController = coordinator.navigationController
    }
}
