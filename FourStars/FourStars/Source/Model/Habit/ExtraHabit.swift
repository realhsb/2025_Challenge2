//
//  ExtraHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class ExtraHabit: BaseHabit {
    var habit: ExtraHabitType?

    init(
        habit: ExtraHabitType? = nil,
        quantity: Int? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil
    ) {
        self.habit = habit
        super.init(
            timeSlot: .extra,
            quantity: quantity,
            startTime: startTime,
            endTime: endTime
        )
    }
}

enum ExtraHabitType: String, CaseIterable, Identifiable, Codable {
    case gratitude = "감사 표현"
    case noPhone = "폰 사용 줄이기"
    case deepBreath = "심호흡"

    var id: String { rawValue }
}

extension ExtraHabit {
    static var stub01: ExtraHabit = .init(habit: .deepBreath, quantity: nil, startTime: nil, endTime: nil)
}
