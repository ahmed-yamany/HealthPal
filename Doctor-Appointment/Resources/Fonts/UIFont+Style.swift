//
//  UIFont+Style.swift
//  SwntQ
//
//  Created by Ahmed Yamany on 12/10/2023.
//

import UIKit.UIFont
// swiftlint: disable all
/*
 -- Inter-Regular
 -- Inter-Regular_Italic
 -- Inter-Regular_Thin
 -- Inter-Regular_Thin-Italic
 -- Inter-Regular_ExtraLight
 -- Inter-Regular_ExtraLight-Italic
 -- Inter-Regular_Light
 -- Inter-Regular_Light-Italic
 -- Inter-Regular_Medium
 -- Inter-Regular_Medium-Italic
 -- Inter-Regular_SemiBold
 -- Inter-Regular_SemiBold-Italic
 -- Inter-Regular_Bold
 -- Inter-Regular_Bold-Italic
 -- Inter-Regular_ExtraBold
 -- Inter-Regular_ExtraBold-Italic
 -- Inter-Regular_Black
 -- Inter-Regular_Black-Italic
for familyName in UIFont.familyNames {
    print (familyName )
    for fontName in UIFont.fontNames (forFamilyName: familyName) {
        print("-- \(fontName)")
    }
}
**/
// MARK: - labels
/// An extension to provide custom font styles using the Cairo and Poppins font families.
public extension UIFont {
    /// Returns a custom font with a bold style and a size of 24 points.
    static var h1: UIFont {
        return .custom(size: 24, weight: .bold)
    }
    /// Returns a custom font with a bold style and a size of 20 points.
    static var h2: UIFont {
        return .custom(size: 20, weight: .bold)
    }
    /// Returns a custom font with a medium weight and a size of 16 points.
    static var h3: UIFont {
        return .custom(size: 16, weight: .semibold)
    }
    /// Returns a custom font with a medium weight and a size of 14 points.
    static var medium: UIFont {
        return .custom(size: 14, weight: .medium)
    }
    /// Returns a custom font with a regular weight and a size of 12 points.
    static var regular: UIFont {
        return .custom(size: 12, weight: .regular)
    }
    /// Returns a custom font with a regular weight and a size of 10 points.
    static var small: UIFont {
        return .custom(size: 10, weight: .regular)
    }
    /// Returns a custom font with the specified size and weight.
    ///
    /// - Parameters:
    ///   - size: The size of the font in points.
    ///   - weight: The weight of the font.
    /// - Returns: A custom font with the given size and weight.
    static func custom(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName = self.fontName(forWeight: weight)
        // Attempt to create a font with the specified name and size
        guard let font = UIFont(name: fontName, size: size) else {
            assertionFailure("Unable to get a font with name: \(fontName)")
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        return font
    }
    /// Returns the appropriate font name based on the specified weight.
    ///
    /// - Parameter weight: The weight of the font.
    /// - Returns: The font name associated with the specified weight.
    static private func fontName(forWeight weight: UIFont.Weight) -> String {
        switch weight {
        case .regular: return "Inter-Regular"
        case .light: return "Inter-Regular_Light"
        case .medium: return "Inter-Regular_Medium"
        case .semibold: return "Inter-Regular_SemiBold"
        case .bold: return "Inter-Regular_Bold"
        case .black: return "Inter-Regular_Black"
        default: return "Inter-Regular"
        }
    }
}
// swiftlint: enable all
