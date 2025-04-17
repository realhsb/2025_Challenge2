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
    case orange
    case pink
    case purple
    case red
    case yellow
    
    var image: Image {
        switch self {
            case .gray:
            return Image("Star_Gray")
        case .lightBlue:
            return Image("Star_LightBlue")
        case .orange:
            return Image("Star_Orange")
        case .pink:
            return Image("Star_Pink")
        case .purple:
            return Image("Star_Purple")
        case .red:
            return Image("Star_Red")
        case .yellow:
            return Image("Star_Yellow")
        }
    }
    
    static var successColors: [Star] {
            return [.lightBlue, .orange, .pink, .purple, .yellow]
    }
        
//    var image: Image {
//        Image("Star_\(rawValue.capitalized)")
//    }
}
