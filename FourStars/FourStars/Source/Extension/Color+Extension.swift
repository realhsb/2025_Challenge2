//
//  Color+Extension.swift
//  FourStars
//
//  Created by Soop on 4/22/25.
//

import SwiftUI

extension Color {
    // basic
    static let basicBlack = Color(hex: "000000")
    static let basicWhite = Color(hex: "FFFFFF")
    
    static let primary = Color(hex: "231C4D")
    static let primaryLight = Color(hex: "C0C1E5")
    
    static let textGray = Color(hex: "6F6F6F")
}

public extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
