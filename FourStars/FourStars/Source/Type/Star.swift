//
//  Star.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import Foundation
import SwiftUI

enum Star: String, Codable, CaseIterable {
    case gray
    case lightBlue
    case lightGreen
    case orange
    case pink
    case purple
    case red
    case yellow
    case noneText
    
    var image: Image {
        switch self {
            case .gray:
            return Image(.starGray)
        case .lightBlue:
            return Image(.starLightBlue)
        case .lightGreen:
            return Image(.starLightGreen)
        case .orange:
            return Image(.starOrange)
        case .pink:
            return Image(.starPink)
        case .purple:
            return Image(.starPurple)
        case .red:
            return Image(.starRed)
        case .yellow:
            return Image(.starYellow)
        case .noneText:
            return Image(.starNoneText)
        }
    }
    
    static var successColors: [Star] {
            return [.lightBlue, .orange, .pink, .purple, .yellow]
    }
        
//    var image: Image {
//        Image("Star_\(rawValue.capitalized)")
//    }
}
