//
//  NewsCollectionViewCell.swift
//  Mega Mall
//
//  Created by Ahmed Yamany on 27/10/2023.
//

import UIKit

final class SplashCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: H3Label!
    @IBOutlet weak var subtitleLabel: RegularLabel!
    //
    public func configure(with splashModel: SplashModel) {
        imageView.image = splashModel.uiImage
        titleLable.text = splashModel.title
        subtitleLabel.text = splashModel.subTitle
    }
}
