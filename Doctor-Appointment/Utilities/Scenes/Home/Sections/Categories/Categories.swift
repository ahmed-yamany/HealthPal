//
//  Categories.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 25/11/2023.
//

import UIKit
import CompositionalLayoutableSection

// MARK: - A custom section for displaying Categories in a collection view.
class CategoriesCollectionViewSection: CompositionalLayoutableSection {
    typealias ItemsType = CategoryModel
    typealias CellType = CategoriesCollectionViewCell
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
// MARK: - Categories CollectionView Section Data Source
extension CategoriesCollectionViewSection: CompositionalLayoutableSectionDataSource {
    // number Of Items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    /// cell For Item At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        let category = items[indexPath.item]
        cell.configure(with: category)
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
// MARK: - Categories CollectionView Section Layout
extension CategoriesCollectionViewSection: CompositionalLayoutableSectionLayout {
    var sectionSpacing: CGFloat { 20 } // The spacing between items in the section.
    var itemWidth: CGFloat { 62 } // The width of each item in the section.
    var groupHeight: CGFloat { 84 } // The height of each item in the section.
    var itemsCountInGroup: Int { 4 } // each group has 4 items
    /// - Returns: The layout for an item within the group.
    var itemLayoutInGroup: NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }
    ///  - Returns: The layout for a group within the section.
    func groupLayoutInSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(groupHeight))
        let group: NSCollectionLayoutGroup
        if #available(iOS 16.0, *) {
            group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: itemLayoutInGroup,
                                                       count: itemsCountInGroup)
        } else {
            group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemLayoutInGroup,
                                                       count: itemsCountInGroup)
        }
        let itemSpace = calculateItemSpacing(layoutEnvironment: layoutEnvironment)
        group.interItemSpacing = .fixed(itemSpace)
        return group
    }
    // return the spacing betweet each item
    func calculateItemSpacing(layoutEnvironment: NSCollectionLayoutEnvironment) -> CGFloat {
        let containerWidth = layoutEnvironment.container.effectiveContentSize.width
        let emptySpace = containerWidth - (CGFloat(itemsCountInGroup) * itemWidth)
        return emptySpace / CGFloat(itemsCountInGroup)
    }
    /// Defines the layout for the entire section, including groups and supplementary views.
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupLayoutInSection(layoutEnvironment: layoutEnvironment))
        section.interGroupSpacing = 16
         section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: sectionSpacing, bottom: 0, trailing: sectionSpacing)
         section.boundarySupplementaryItems = [topSupplementaryItem]
        return section
    }
}
// MARK: - Categories CollectionView Section Delegate
extension CategoriesCollectionViewSection: CompositionalLayoutableSectionDelegate {
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
    /*
     ///
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     }
     */
}

// MARK: - Private Handelers
extension CategoriesCollectionViewSection {
    private var topSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem {
        let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        return  NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize,
                                                            elementKind: TopSupplementaryViewType.identifier,
                                                            alignment: .top)
    }
}

extension CategoriesCollectionViewSection: CollectionReusableViewDelegate {
    func seeAllButtonTapped() {
        print("Tapped")
    }
    func getTitle(for reusableView: UICollectionReusableView) -> String {
        "Categories"
    }
}
