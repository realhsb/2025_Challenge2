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
    var habit: AfternoonHabitType?
    
    @Relationship
    var baseHabit: BaseHabit

    init(
        habit: AfternoonHabitType? = nil,
        baseHabit: BaseHabit
    ) {
        self.habit = habit
        self.baseHabit = baseHabit
    }
}

enum AfternoonHabitType: String, CaseIterable, Identifiable, Codable {
    case walk = "산책"
    case read = "책"
    case meditate = "명상"
    
    var id: String { rawValue }
}

//extension AfternoonHabit {
//    static var stub01: AfternoonHabit = .init(habit: .meditate, quantity: nil, startTime: nil, endTime: nil)
//}
