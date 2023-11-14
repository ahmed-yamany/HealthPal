//
//  SplashView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import UIKit
import Extensions
import CompositionalLayoutableSection

class SplashView: UIView, CompositionalLayoutProvider {
    // MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: FlexiblePageControl!
    //
    // MARK: - Properties
    let delegate: SplashViewDelegate
    ///
    var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    let collectionViewSection = SplashCollectionViewSection()
    ///
    lazy var collectionViewDelegate = CompositionalLayoutDelegate(provider: self)
    lazy var collectionViewDataSource = CompositionalLayoutDataSource(provider: self)
    //
    // MARK: Init
    init(delegate: SplashViewDelegate) {
        self.delegate = delegate
        super.init(frame: .infinite)
        loadNib()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    public func selectPage(at index: Int) {
        pageControl.currentPage = index
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
    }
}
//
// MARK: - Configurations
private extension SplashView {
    func configureUI() {
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
        collectionView.isScrollEnabled = false
        collectionView.isUserInteractionEnabled = false
        //
        compositionalLayoutSections.append(collectionViewSection)
        collectionView.updateCollectionViewCompositionalLayout(for: self)
    }
}
//
// MARK: - Actions
private extension SplashView {
    @IBAction func nextButtonTapped(_ sender: PrimaryButton) {
        moveToNextPage()
    }
    @IBAction func skipButtonTapped(_ sender: RegularButton) {
        delegate.skipButtonDidTapped()
    }
    //
    func moveToNextPage() {
        delegate.nextButtonDidTapped()
    }
}
//
private extension SplashView {
    /// Loads the view from a nib file and adds it as a subview to the SplashView view.
    func loadNib() {
        // Please do not update this code, as it's used to load the view from a nib.
        // swiftlint:disable all
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)![0] as! UIView
        addSubview(view)
        view.frame = bounds
        // swiftlint:enable all
    }
}
