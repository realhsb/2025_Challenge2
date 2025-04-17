//
//  HabitStatus.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import Foundation

enum HabitStatus: String {
    case notDone = "notDone"
    case success = "success"
    case failure = "failure"
    
    var star: Star {
            switch self {
            case .notDone:
                return .gray
            case .failure:
                return .red
            case .success:
                return Star.successColors.randomElement() ?? .lightBlue
            }
    }
}
