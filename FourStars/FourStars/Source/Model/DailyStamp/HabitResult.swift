//
//  HabitResult.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import SwiftData
import Foundation

@Model
class HabitResult {
    var status: HabitStatus = HabitStatus.notDone
    private var fixedSuccessStar: Star? = nil

    var star: Star {
        switch status {
        case .notDone:
            return .gray
        case .failure:
            return .red
        case .success:
            return fixedSuccessStar ?? {
                let color = Star.successColors.randomElement() ?? .yellow
                fixedSuccessStar = color
                return color
            }()
        }
    }

    init(status: HabitStatus) {
        self.status = status
        if status == .success {
            fixedSuccessStar = Star.successColors.randomElement() ?? .yellow
        }
    }
}
