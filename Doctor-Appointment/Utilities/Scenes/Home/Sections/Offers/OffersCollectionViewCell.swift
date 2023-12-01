//
//  NewsCollectionViewCell.swift
//  Mega Mall
//
//  Created by Ahmed Yamany on 27/10/2023.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: H3Label!
    @IBOutlet weak var subtitleLabel: RegularLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(with offer: OfferModel) {
        imageView.image = offer.uiImage
        titleLabel.text = offer.title
        subtitleLabel.text = offer.subtitle
    }
}
