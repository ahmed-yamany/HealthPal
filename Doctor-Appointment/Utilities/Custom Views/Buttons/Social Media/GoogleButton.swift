//
//  GoogleButton.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 14/11/2023.
//

import UIKit
import Extensions
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

open class GoogleButton: SocialMediaButton {
    override func setup() {
        super.setup()
        title = L10n.SocialMedia.google
        icon = .iconGoogle.withRenderingMode(.alwaysOriginal)
        addAction(UIAction { _ in self.performGoogleSignIn() }, for: .touchUpInside)
    }
    //
    func performGoogleSignIn() {
        guard let topMostViewController = UIApplication.shared.topMostViewController() else {
            Logger.log("Failed to get topMostViewController", category: \.default, level: .fault)
            return
        }
        //
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            Logger.log("Failed to get firebase Client ID", category: \.default, level: .fault)
            return
        }
        //
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        //
        startSignin(with: clientID, in: topMostViewController)
    }
    ///
    func startSignin(with clientID: String, in viewController: UIViewController) {
        Task {
            do {
                let result: GIDSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController)
                await self.performSignin(to: result)
            } catch {
                DispatchQueue.main.async {
                    AlertController.shared.preset(type: .error, with: "Failed to Login with google account")
                }
            }
        }
    }
    ///
    func performSignin(to result: GIDSignInResult) async {
        guard let idToken = result.user.idToken?.tokenString else {
            Logger.log("Failed to get user id Token while google login", category: \.default, level: .fault)
            return
        }
        //
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: result.user.accessToken.tokenString)
        do {
            let result = try await Auth.auth().signIn(with: credential)
            DispatchQueue.main.async {
                AppCoordinator.shared.checkLogin()
            }
        } catch {
            DispatchQueue.main.async {
                AlertController.shared.preset(type: .error, with: error.localizedDescription)
            }
        }
    }
}
