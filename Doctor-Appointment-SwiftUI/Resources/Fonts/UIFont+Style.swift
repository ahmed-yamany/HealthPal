//
//  UIFont+Style.swift
//  SwntQ
//
//  Created by Ahmed Yamany on 12/10/2023.
//

import SwiftUI
// swiftlint: disable all
// An extension to provide custom font styles using the Cairo and Poppins font families.
public extension Font {
    /// Returns a custom font with a bold style and a size of 24 points.
    static var h1: Font {
        return .custom(size: 24, weight: .bold)
    }
    /// Returns a custom font with a bold style and a size of 20 points.
    static var h2: Font {
        return .custom(size: 20, weight: .bold)
    }
    /// Returns a custom font with a medium weight and a size of 16 points.
    static var h3: Font {
        return .custom(size: 16, weight: .semibold)
    }
    /// Returns a custom font with a medium weight and a size of 14 points.
    static var medium: Font {
        return .custom(size: 14, weight: .medium)
    }
    /// Returns a custom font with a regular weight and a size of 12 points.
    static var regular: Font {
        return .custom(size: 12, weight: .regular)
    }
    /// Returns a custom font with a regular weight and a size of 10 points.
    static var small: Font {
        return .custom(size: 10, weight: .regular)
    }
    /// Returns a custom font with the specified size and weight.
    ///
    /// - Parameters:
    ///   - size: The size of the font in points.
    ///   - weight: The weight of the font.
    /// - Returns: A custom font with the given size and weight.
    static func custom(size: CGFloat, weight: Font.Weight) -> Font {
        let fontName = self.fontName(forWeight: weight)
        return Font.custom(fontName, size: size)
    }
    /// Returns the appropriate font name based on the specified weight.
    ///
    /// - Parameter weight: The weight of the font.
    /// - Returns: The font name associated with the specified weight.
    static private func fontName(forWeight weight: Font.Weight) -> String {
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
