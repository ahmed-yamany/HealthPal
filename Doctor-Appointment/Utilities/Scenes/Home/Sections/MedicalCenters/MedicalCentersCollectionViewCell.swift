//
//  NewsCollectionViewCell.swift
//  Mega Mall
//
//  Created by Ahmed Yamany on 27/10/2023.
//

import UIKit

class MedicalCentersCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    func configureUI() {
//        layer.masksToBounds = true
        layer.shadowColor = UIColor.doap200.cgColor
        layer.shadowOpacity = 10
        layer.shadowOffset = .zero
    }
}
