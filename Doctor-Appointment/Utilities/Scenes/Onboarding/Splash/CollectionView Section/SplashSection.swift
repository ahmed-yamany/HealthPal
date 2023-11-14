//
//  Splash.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 11/11/2023.
//

import UIKit
import CompositionalLayoutableSection

// MARK: - A custom section for displaying Splash in a collection view.
class SplashCollectionViewSection: CompositionalLayoutableSection {
    typealias ItemsType = SplashModel
    typealias CellType = SplashCollectionViewCell
    //
    var items: [ItemsType] = []
    //
    override init() {
        super.init()
        delegate = self
        dataSource = self
        layout = self
    }
}
// MARK: - Splash CollectionView Section Data Source
extension SplashCollectionViewSection: CompositionalLayoutableSectionDataSource {
    // number Of Items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    /// cell For Item At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        let splashModel = items[indexPath.item]
        cell.configure(with: splashModel)
        return cell
    }
}
// MARK: - Splash CollectionView Section Layout
extension SplashCollectionViewSection: CompositionalLayoutableSectionLayout {
    /// - Returns: The layout for an item within the group.
    var itemLayoutInGroup: NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }
    ///  - Returns: The layout for a group within the section.
    var groupLayoutInSection: NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemLayoutInGroup])
        return group
    }
    /// Defines the layout for the entire section, including groups and supplementary views.
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupLayoutInSection)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}
// MARK: - Splash CollectionView Section Delegate
extension SplashCollectionViewSection: CompositionalLayoutableSectionDelegate {
    /// Registers the cell type with the given collection view.
    func registerCell(_ collectionView: UICollectionView) {
        collectionView.registerFromNib(CellType.self)
    }
//    collection
}
