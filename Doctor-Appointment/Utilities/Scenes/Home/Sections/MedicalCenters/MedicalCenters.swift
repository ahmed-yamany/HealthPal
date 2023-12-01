//
//  MedicalCenters.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 25/11/2023.
//

import UIKit
import CompositionalLayoutableSection

// MARK: - A custom section for displaying MedicalCenters in a collection view.
class MedicalCentersCollectionViewSection: CompositionalLayoutableSection {
    typealias ItemsType = String
    typealias CellType = MedicalCentersCollectionViewCell
    typealias TopSupplementaryViewType = CollectionReusableView
    //
    var items: [ItemsType] = []
    var viewController: UIViewController?
    override init() {
        super.init()
        delegate = self
        dataSource = self
        layout = self
    }
    //
    private var isConfigured = false
    public func configure(owner viewController: UIViewController) {
        guard !isConfigured else { return }
        isConfigured = true
        self.viewController = viewController
    }
}
// MARK: - MedicalCenters CollectionView Section Data Source
extension MedicalCentersCollectionViewSection: CompositionalLayoutableSectionDataSource {
    // number Of Items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    /// cell For Item At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        return cell
    }
    // view For Supplementary Element Of Kind
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(TopSupplementaryViewType.self,
                                                                   ofKind: TopSupplementaryViewType.identifier,
                                                                   for: indexPath)
        view.delegate = self
        return view
    }
}
// MARK: - MedicalCenters CollectionView Section Layout
extension MedicalCentersCollectionViewSection: CompositionalLayoutableSectionLayout {
    var spacing: CGFloat { 16 } // The spacing between items in the section.
    var width: CGFloat { 232 } // The width of each item in the section.
    var height: CGFloat { 256 } // The height of each item in the section.
    /// - Returns: The layout for an item within the group.
    var itemLayoutInGroup: NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }
    ///  - Returns: The layout for a group within the section.
    var groupLayoutInSection: NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemLayoutInGroup])
        return group
    }
    /// Defines the layout for the entire section, including groups and supplementary views.
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupLayoutInSection)
         section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = spacing
         section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
         section.boundarySupplementaryItems = [topSupplementaryItem]
        return section
    }
}
// MARK: - MedicalCenters CollectionView Section Delegate
extension MedicalCentersCollectionViewSection: CompositionalLayoutableSectionDelegate {
    /// Registers the cell type with the given collection view.
    func registerCell(_ collectionView: UICollectionView) {
        collectionView.registerFromNib(CellType.self)
    }
    /**
     Registers the supplementary view types
     - Note: you can register here more supplementary views for the section by changing 'supplementaryViewOfKind'
     */
     func registerSupplementaryView(_ collectionView: UICollectionView) {
        collectionView.register(TopSupplementaryViewType.self, supplementaryViewOfKind: TopSupplementaryViewType.identifier)
     }
}

// MARK: - Private Handelers
extension MedicalCentersCollectionViewSection {
    private var topSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem {
        let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        return  NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize,
                                                            elementKind: TopSupplementaryViewType.identifier,
                                                            alignment: .top)
    }
}
extension MedicalCentersCollectionViewSection: CollectionReusableViewDelegate {
    func seeAllButtonTapped() {
        print("medical center tapped")
    }
    func getTitle(for reusableView: UICollectionReusableView) -> String {
        "Nearby Medical Centers"
    }
}
