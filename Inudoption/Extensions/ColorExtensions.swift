//
//  ColorExtensions.swift
//  Inudoption
//
//  Created by Martin García on 7/20/22.
//

import SwiftUI

// Create an extension of Color that receives a Hex Value and converts it into an usable color

// MARK: - Custom initializers

extension Color {
    init(hex: Int) {
        let redComponent = (hex >> 16) & 0xFF
        let greenComponent = (hex >> 8) & 0xFF
        let blueComponent = hex & 0xFF
        let uiColor = UIColor(red: CGFloat(redComponent) / 255.0,
                              green: CGFloat(greenComponent) / 255.0,
                              blue: CGFloat(blueComponent) / 255.0,
                              alpha: 1.0)
        // We will initialize our color
        self.init(uiColor)
    }
}

// MARK: - Properties

extension Color {
    static let inuPrimary = Color(hex: 0xFFB68F)
    static let inuSecondary = Color(hex: 0xFBD3AE)
    static let inuTertiary = Color(hex: 0x3C3C43)
}
