//
//  Offers.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 23/11/2023.
//

import UIKit
import CompositionalLayoutableSection
import Combine

// MARK: - A custom section for displaying Offers in a collection view.
class OffersCollectionViewSection: CompositionalLayoutableSection {
    typealias ItemsType = OfferModel
    typealias CellType = OffersCollectionViewCell
    typealias BottomSupplementaryViewType = OffersDecorationView
    // typealias DecorationViewType = UICollectionReusableView
    //
    @Published var currentPage: Int = 0
    var currentPageCancellable: AnyCancellable!
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
// MARK: - Offers CollectionView Section Data Source
extension OffersCollectionViewSection: CompositionalLayoutableSectionDataSource {
    // number Of Items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    /// cell For Item At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        let offer = items[indexPath.item]
        cell.configure(with: offer)
        return cell
    }
    // view For Supplementary Element Of Kind
     func collectionView(_ collectionView: UICollectionView,
                         viewForSupplementaryElementOfKind kind: String,
                         at indexPath: IndexPath) -> UICollectionReusableView {
         let view = collectionView.dequeueReusableSupplementaryView(BottomSupplementaryViewType.self,
                                                                    ofKind: BottomSupplementaryViewType.identifier,
                                                                    for: indexPath)
         view.pageControl.numberOfPages = items.count
         currentPageCancellable = AnyCancellable($currentPage.assign(to: \.currentPage, on: view.pageControl))
         return view
     }
}
// MARK: - Offers CollectionView Section Layout
extension OffersCollectionViewSection: CompositionalLayoutableSectionLayout {
    var spacing: CGFloat { 20 } // The spacing between items in the section.
    var width: CGFloat { 66 + spacing } // The width of each item in the section.
    var height: CGFloat { 164 } // The height of each item in the section.
    /// - Returns: The layout for an item within the group.
    var itemLayoutInGroup: NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }
    ///  - Returns: The layout for a group within the section.
    var groupLayoutInSection: NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemLayoutInGroup])
        // group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: 0)
        return group
    }
    /// Defines the layout for the entire section, including groups and supplementary views.
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupLayoutInSection)
        section.interGroupSpacing = spacing
         section.orthogonalScrollingBehavior = .groupPagingCentered
         section.boundarySupplementaryItems = [topSupplementaryItem]
        section.visibleItemsInvalidationHandler = {
            self.currentPageDidChanged(withItems: $0, offset: $1, layoutEnvironment: $2) { page in
                self.currentPage = page
            }
        }
        return section
    }
}
// MARK: - Offers CollectionView Section Delegate
extension OffersCollectionViewSection: CompositionalLayoutableSectionDelegate {
    /// Registers the cell type with the given collection view.
    func registerCell(_ collectionView: UICollectionView) {
        collectionView.registerFromNib(CellType.self)
    }
    /**
     Registers the supplementary view types
     - Note: you can register here more supplementary views for the section by changing 'supplementaryViewOfKind'
     */
     func registerSupplementaryView(_ collectionView: UICollectionView) {
        collectionView.register(BottomSupplementaryViewType.self, supplementaryViewOfKind: BottomSupplementaryViewType.identifier)
     }
    /*
     /// Registers the Decoration view for the secition
     func registerDecorationView(_ layout: UICollectionViewCompositionalLayout) {
         layout.register(DecorationViewType.self, forDecorationViewOfKind: DecorationViewType.identifier)
     }
     */
    /*
     ///
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     }
     */
}

// MARK: - Private Handelers
extension OffersCollectionViewSection {
    private var topSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem {
        let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(34))
        return  NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize,
                                                            elementKind: BottomSupplementaryViewType.identifier,
                                                            alignment: .bottom)
    }
}
