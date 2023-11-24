//
//  TabBarViewController.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit
import Extensions
import ViewAnimator

class TabBarViewController: UITabBarSelectionController {
    // MARK: - Properties
    let viewModel = TabBarViewModel.shared
    //
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func tabBarDidSelect(_ tabBar: UITabBar, item: UITabBarItem, view: UIView) {
        TabBarViewModel.shared.notifications.append(.init(isRead: false))
        if TabBarType.home.equals(item) {
            homeAnimate(view)
        } else if TabBarType.location.equals(item) {
            locationAnimate(view)
        } else if TabBarType.appointment.equals(item) {
            appointmentAnimate(view)
        } else {
            profileAnimate(view)
        }
    }
}
//
// MARK: - Configurations
private extension TabBarViewController {
    func configure() {
        viewControllers = viewModel.viewControllers
        subscribeSelectedItem()
        subscribeTabBarIsHidden()
    }
    ///
    func subscribeSelectedItem() {
        viewModel.$selectedItem
            .map { $0.index }
            .assign(to: \.selectedIndex, on: self)
            .store(in: &viewModel.cancellableSet)
    }
    ///
    func subscribeTabBarIsHidden() {
        viewModel.$tabBarIsHidden
            .map { isHidden in
                self.tabBar.animate(animations: [AnimationType.from(direction: .bottom, offset: 100)])
                return isHidden
            }
            .assign(to: \.isHidden, on: tabBar)
            .store(in: &viewModel.cancellableSet)
    }

}
//
// MARK: - Private Handeler
private extension TabBarViewController {
    func homeAnimate(_ view: UIView) {
        view.animateKeyFrames(animations: [
            AnimationType.vector(.init(dx: 10, dy: 0)),
            AnimationType.vector(.init(dx: 0, dy: 0)),
            AnimationType.vector(.init(dx: -10, dy: 0)),
            AnimationType.vector(.init(dx: 0, dy: 0)),
            AnimationType.zoom(scale: 0.5),
            AnimationType.zoom(scale: 1.3),
            AnimationType.zoom(scale: 1)
        ], initialAlpha: 1, duration: 1)
    }
    func locationAnimate(_ view: UIView) {
        view.animateKeyFrames(animations: [
            AnimationType.from(direction: .bottom, offset: -20),
            AnimationType.from(direction: .bottom, offset: 10),
            AnimationType.zoom(scale: 0.9),
            AnimationType.from(direction: .bottom, offset: -10),
            AnimationType.zoom(scale: 1),
            AnimationType.from(direction: .bottom, offset: 0)
        ], initialAlpha: 1, duration: 1)
    }
    func appointmentAnimate(_ view: UIView) {
        let angle: CGFloat = .pi / 8
        view.animateKeyFrames(animations: [
            AnimationType.zoom(scale: 1.5),
            AnimationType.rotate(angle: -angle),
            AnimationType.zoom(scale: 0.7),
            AnimationType.rotate(angle: 0),
            AnimationType.zoom(scale: 1.3),
            AnimationType.zoom(scale: 1)
        ], initialAlpha: 1, duration: 1)
    }
    func profileAnimate(_ view: UIView) {
        view.animateKeyFrames(animations: [
            AnimationType.zoom(scale: 0.9),
            AnimationType.zoom(scale: 0.7),
            AnimationType.zoom(scale: 0.5),
            AnimationType.rotate(angle: 90),
            AnimationType.rotate(angle: 180),
            AnimationType.rotate(angle: 270),
            AnimationType.rotate(angle: 360),
            AnimationType.rotate(angle: 0),
            AnimationType.zoom(scale: 1)
        ], initialAlpha: 1, duration: 1)
    }
}
