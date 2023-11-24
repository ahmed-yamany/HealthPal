//
//  File.swift
//  
//
//  Created by Ahmed Yamany on 22/11/2023.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
