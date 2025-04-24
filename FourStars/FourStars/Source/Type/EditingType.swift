//
//  EditingType.swift
//  FourStars
//
//  Created by Soop on 4/24/25.
//

import SwiftUI

enum EditingType {
    case editing
    case stamping
}

extension EditingType {
    var description: String {
        switch self {
        case .editing:
            return "수정하기"
        case .stamping:
            return "인증하기"
        }
    }
    
    var image: Image {
        switch self {
        case .editing:
            return Image(.buttonPaper)
        case .stamping:
            return Image(.buttonStamp)
        }
    }
}
