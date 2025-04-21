//
//  AfternoonHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class AfternoonHabit {
    var timeSlot: TimeSlot = TimeSlot.afternoon
//    var habit: AfternoonHabitType?
    var habitString: String?
    
    @Relationship
    var baseHabit: BaseHabit

    init(
        habitString: String? = nil,
        baseHabit: BaseHabit
    ) {
        self.habitString = habitString
        self.baseHabit = baseHabit
    }
}

extension AfternoonHabit {
    static var stub01: AfternoonHabit = .init(baseHabit: .stub01)
}
