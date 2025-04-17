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
    var statusRaw: String
    var starRaw: String

    var status: HabitStatus {
        get { HabitStatus(rawValue: statusRaw) ?? .notDone }
        set { statusRaw = newValue.rawValue }
    }

    var star: Star {
        get { Star(rawValue: starRaw) ?? .gray }
        set { starRaw = newValue.rawValue }
    }

    init(status: HabitStatus) {
        self.statusRaw = status.rawValue
        switch status {
        case .notDone:
            self.starRaw = Star.gray.rawValue
        case .failure:
            self.starRaw = Star.red.rawValue
        case .success:
            self.starRaw = Star.successColors.randomElement()?.rawValue ?? Star.yellow.rawValue
        }
    }

    // SwiftData requires a no-arg init
    init() {
        self.statusRaw = HabitStatus.notDone.rawValue
        self.starRaw = Star.gray.rawValue
    }
}
