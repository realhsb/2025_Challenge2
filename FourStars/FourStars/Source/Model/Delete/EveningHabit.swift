//
//  EveningHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class EveningHabit {
    var timeSlot: TimeSlot = TimeSlot.evening
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


