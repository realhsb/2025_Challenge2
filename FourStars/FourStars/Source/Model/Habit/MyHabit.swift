//
//  Habit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class MyHabit {
    var date: Date = Date()
    var morningHabit: MorningHabitType = MorningHabitType.none
    var afternoonHabit: AfternoonHabitType = AfternoonHabitType.none
    var eveningHabit: EveningHabitType = EveningHabitType.none
    var extraHabit: ExtraHabitType = ExtraHabitType.none
    
    init(
        date: Date
    ) {
        self.date = date
    }
}

extension MyHabit {
    static var stub01: MyHabit = .init(date: Date())
}

extension MyHabit {
    func isSaved() -> Bool {
        if morningHabit == .none || afternoonHabit == .none || eveningHabit == .none || extraHabit == .none {
            return false
        } else {
            return true
        }
    }
}

