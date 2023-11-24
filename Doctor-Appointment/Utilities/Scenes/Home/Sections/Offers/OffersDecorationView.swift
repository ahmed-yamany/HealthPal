//
//  OffersDecorationView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 24/11/2023.
//

import UIKit
import Extensions
import MakeConstraints

class OffersDecorationView: UICollectionReusableView {
    let pageControl = FlexiblePageControl()
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        update()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        update()
    }
    func update() {
        addSubview(pageControl)
        pageControl.centerInSuperview()
        pageControl.pageTintColor = .doap500
        pageControl.currentPageTintColor = .doapMain
        pageControl.currentPageWidth = 28
    }
}

