//
//  File.swift
//  
//
//  Created by Ahmed Yamany on 28/10/2023.
//

import UIKit

public extension UIView {
    /// Rounds the specified corners of the view with the given radius.
    ///
    /// - Parameters:
    ///   - corners: The UIRectCorner values representing the corners to round.
    ///   - radius: The radius to use for rounding the corners.
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners.toCACornerMask()
    }
}

public extension UIRectCorner {
    /// Converts UIRectCorner to CACornerMask.
    ///
    /// - Returns: A CACornerMask value representing the converted corners.
    func toCACornerMask() -> CACornerMask {
        var cornerMask: CACornerMask = []
        //
        if contains(.topLeft) {
            cornerMask.insert(.layerMinXMinYCorner)
        }
        if contains(.topRight) {
            cornerMask.insert(.layerMaxXMinYCorner)
        }
        if contains(.bottomLeft) {
            cornerMask.insert(.layerMinXMaxYCorner)
        }
        if contains(.bottomRight) {
            cornerMask.insert(.layerMaxXMaxYCorner)
        }
        //
        return cornerMask
    }
}

public extension UIView {
    @discardableResult
    func makeCircle(borderWidth: CGFloat = 1.5, borderColor: UIColor = .blue) -> UIView {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        widthAnchor.constraint(equalToConstant: frame.height).isActive = true
        // heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        layer.cornerRadius = frame.height / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        return self
    }
}
