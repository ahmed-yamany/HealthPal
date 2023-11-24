//
//  HomeView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 21/11/2023.
//

import UIKit
import CompositionalLayoutableSection

class HomeCollectionView: UICollectionView, CompositionalLayoutProvider {
    // MARK: IBOutlet
    //
    // MARK: - Properties
    let viewModel: HomeViewModel
    var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    lazy var compDelegate = CompositionalLayoutDelegate(provider: self)
    lazy var compDataSource = CompositionalLayoutDataSource(provider: self)
    // MARK: Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .infinite, collectionViewLayout: .init())
        delegate = compDelegate
        dataSource = compDataSource
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//
// MARK: - Configurations
private extension HomeCollectionView {
    func configureUI() {
        let section = OffersCollectionViewSection()
        section.items = Array(repeating: "h", count: 10)
        compositionalLayoutSections.append(section)
        updateCollectionViewCompositionalLayout(for: self)
    }
}
//
// MARK: - Actions
private extension HomeCollectionView {
}
