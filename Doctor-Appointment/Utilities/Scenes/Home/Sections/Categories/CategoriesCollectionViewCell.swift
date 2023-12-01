//
//  NewsCollectionViewCell.swift
//  Mega Mall
//
//  Created by Ahmed Yamany on 27/10/2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconBackgroundView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: MediumLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(with category: CategoryModel) {
        iconBackgroundView.backgroundColor = category.uiBackgroundColor
        iconImageView.image = category.uiImage
        titleLabel.text = category.title
    }
}
