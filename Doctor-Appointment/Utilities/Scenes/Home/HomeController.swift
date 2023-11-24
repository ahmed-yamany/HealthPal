//
//  HomeController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit
import Combine

protocol HomeViewDelegate {
}
//
class HomeController: UIViewController {
    // MARK: - View
    lazy var collectionView = HomeCollectionView(viewModel: viewModel)
    let notificationBellView = BellView()
    let locationView = HomeLocationView()
    //
    // MARK: - Properties
    let viewModel = HomeViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = collectionView
        updateView()
        configure()
    }
}
//
// MARK: - SignupViewDelegate
extension HomeController: HomeViewDelegate {
}
//
// MARK: - Private Handlers
private extension HomeController {
    func updateView() {
        navigationItem.rightBarButtonItem = .init(customView: notificationBellView)
        navigationItem.leftBarButtonItem = .init(customView: locationView)
    }
}

//
// MARK: - Configurations
private extension HomeController {
    func configure() {
        subscribeToNotifications()
    }
    func subscribeToNotifications() {
        TabBarViewModel.shared.$notifications
            .map { $0.hasUnreadNotification()}
            .assign(to: \.ring, on: notificationBellView)
            .store(in: &TabBarViewModel.shared.cancellableSet)
    }
}
