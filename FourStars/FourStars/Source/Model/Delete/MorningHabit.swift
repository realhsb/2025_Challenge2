//
//  MorningHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class MorningHabit {
    var timeSlot: TimeSlot?
    var habit: MorningHabitType?
    
    @Relationship
    var baseHabit: BaseHabit

    init(
        habit: MorningHabitType? = nil,
        baseHabit: BaseHabit
    ) {
        self.habit = habit
        self.baseHabit = baseHabit
    }
}

extension MorningHabit {
    static var stub01: MorningHabit = .init(habit: MorningHabitType.drinkWater, baseHabit: .stub01)
//    static var stub02: MorningHabit = .init(habit: .drinkWater, baseHabit: .stub01)
}
