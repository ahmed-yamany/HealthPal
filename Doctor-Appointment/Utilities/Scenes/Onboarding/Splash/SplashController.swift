//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit

class SplashController: UIViewController {
    // MARK: - Outlets
    lazy var splashView = SplashView(viewModel: viewModel)
    //
    // MARK: - Properties
    let viewModel = SplashViewModel()
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = splashView
        featchSplashesAndUpdateView()
    }
}
//
// MARK: - Private Handlers
private extension SplashController {
    //
    func featchSplashesAndUpdateView() {
        Task { [unowned self] in
            do {
                let items = try await viewModel.getSplashes()
                updateSplashView(with: items)
            } catch {
                // Handel Error Here
            }
        }
    }
    //
    func updateSplashView(with items: [SplashModel]) {
        updateSplashItems(items)
        updateNumberOfPages(with: items.count)
        subscribeToCurrentPageIndex()
        subscribeToSkip()
    }
    //
    func updateSplashItems(_ items: [SplashModel]) {
        splashView.collectionViewSection.items = items
        splashView.collectionView.reloadData()
    }
    //
    func updateNumberOfPages(with number: Int) {
        viewModel.numberOfPages = number
        splashView.pageControl.numberOfPages = number
    }
    //
    func subscribeToCurrentPageIndex() {
        viewModel.$currentPageIndex.sink { [unowned self] currentPage in
            if currentPage < viewModel.numberOfPages {
                splashView.selectPage(at: currentPage)
            } else {
                viewModel.skip = true
            }
        }
        .store(in: &viewModel.cancellableSet)
    }
    //
    func subscribeToSkip() {
        viewModel.$skip
            .filter { $0 == true }
            .sink { [unowned self] _ in
                navigateToLogin()
            }
            .store(in: &viewModel.cancellableSet)
    }
    func navigateToLogin() {
        let loginVC = AppCoordinator.shared.login()
        present(loginVC, animated: true)
    }
}
