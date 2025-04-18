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
    var today: Date
    
    @Relationship var morningHabit: MorningHabit?
    @Relationship var afternoonHabit: AfternoonHabit?
    @Relationship var eveningHabit: EveningHabit?
    @Relationship var extraHabit: ExtraHabit?
    
    init(
        today: Date,
        morningHabit: MorningHabit? = nil,
        afternoonHabit: AfternoonHabit? = nil,
        eveningHabit: EveningHabit? = nil,
        extraHabit: ExtraHabit? = nil
    ) {
        self.today = today
        self.morningHabit = morningHabit
        self.afternoonHabit = afternoonHabit
        self.eveningHabit = eveningHabit
        self.extraHabit = extraHabit
    }
}

extension DailyHabit {
    static var stub01: DailyHabit = .init(today: Date())
}

extension DailyHabit {
    func isSaved() -> Bool {
        if morningHabit != nil && afternoonHabit != nil && eveningHabit != nil && extraHabit != nil {
            return true
        } else {
            return false
        }
    }
}

