//
//  SplashController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit

protocol SplashViewDelegate {
    func nextButtonDidTapped()
    func skipButtonDidTapped()
}
//
class SplashController: UIViewController {
    // MARK: - Outlets
    lazy var splashView = SplashView(delegate: self)
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
                let splashes = try await viewModel.getSplashes()
                updateSplashView(with: splashes)
            } catch {
                // Handel Error Here
            }
        }
    }
    //
    func updateSplashView(with splashes: [SplashModel]) {
        viewModel.splashes = splashes
        updateSplashItems(splashes)
        updateNumberOfPages(with: splashes.count)
    }
    //
    func updateSplashItems(_ items: [SplashModel]) {
        splashView.collectionViewSection.items = items
        splashView.collectionView.reloadData()
    }
    //
    func updateNumberOfPages(with number: Int) {
        splashView.pageControl.numberOfPages = number
    }
}
///
extension SplashController: SplashViewDelegate {
    func nextButtonDidTapped() {
        viewModel.currentPageIndex += 1
        //
        if viewModel.isLastPage() {
            enableUserInteractionOnCollectionView()
        }
        //
        if viewModel.hasMorePages() {
            splashView.selectPage(at: viewModel.currentPageIndex)
        } else {
            skipButtonDidTapped()
        }
    }
    //
    func skipButtonDidTapped() {
        navigateToLogin()
    }
    //
    func navigateToLogin() {
        AppCoordinator.shared.login()
    }
    //
    private func enableUserInteractionOnCollectionView() {
        splashView.collectionView.isUserInteractionEnabled = true
    }
}
