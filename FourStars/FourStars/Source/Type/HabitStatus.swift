//
//  HabitStatus.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import Foundation

enum HabitStatus: Codable {
    case notDone
    case success
    case failure
    
    var star: Star {
            switch self {
            case .notDone:
                return .noneText
            case .failure:
                return .red
            case .success:
                return Star.successColors.randomElement() ?? .lightBlue
            }
    }
}
