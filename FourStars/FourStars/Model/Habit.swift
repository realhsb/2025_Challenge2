//
//  Habit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class DailyHabit {
    var uuid = UUID().uuidString
    var date: Date
    var morningHabit: MorningHabit?
    var afternoonHabit: AfternoonHabit?
    var eveningHabit: EveningHabit?
    var extraHabit: ExtraHabit?
    
    init(
        date: Date,
        morningHabit: MorningHabit? = nil,
        afternoonHabit: AfternoonHabit? = nil,
        eveningHabit: EveningHabit? = nil,
        extraHabit: ExtraHabit? = nil
    ) {
        self.date = date
        self.morningHabit = morningHabit
        self.afternoonHabit = afternoonHabit
        self.eveningHabit = eveningHabit
        self.extraHabit = extraHabit
    }
}

extension DailyHabit {
    static var dailyHabit01: DailyHabit = .init(date: Date(), morningHabit: .stub01, afternoonHabit: .stub01, eveningHabit: <#T##EveningHabit?#>, extraHabit: <#T##ExtraHabit?#>)
}
