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
    let viewModel: SplashViewModel
    ///
    var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    lazy var collectionViewSection = SplashCollectionViewSection(viewModel: viewModel)
    ///
    lazy var delegate = CompositionalLayoutDelegate(provider: self)
    lazy var dataSource = CompositionalLayoutDataSource(provider: self)
    //
    // MARK: Init
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(frame: .infinite)
        loadNib()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    public func selectPage(at index: Int) {
        pageControl.currentPage = index
    }
}
//
// MARK: - Configurations
private extension SplashView {
    func configureUI() {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.isScrollEnabled = false
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
        viewModel.skip = true
    }
    //
    func moveToNextPage() {
        viewModel.currentPageIndex += 1
        let indexPath = IndexPath(item: viewModel.currentPageIndex, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
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
