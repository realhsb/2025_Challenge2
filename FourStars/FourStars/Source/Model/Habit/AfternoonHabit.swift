//
//  AfternoonHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class AfternoonHabit: BaseHabit {
    var habit: AfternoonHabitType?

    init(
        habit: AfternoonHabitType? = nil,
        quantity: Int? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil
    ) {
        self.habit = habit
        super.init(
            timeSlot: .afternoon,
            quantity: quantity,
            startTime: startTime,
            endTime: endTime
        )
    }
}


enum AfternoonHabitType: String, CaseIterable, Identifiable, Codable {
    case walk = "산책"
    case read = "책"
    case meditate = "명상"
    
    var id: String { rawValue }
}

extension AfternoonHabit {
    static var stub01: AfternoonHabit = .init(habit: .meditate, quantity: nil, startTime: nil, endTime: nil)
}
