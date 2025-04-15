//
//  Habit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class Habit {
    var uuid = UUID().uuidString
    var date: Date
    var timeSlot: TimeSlot
    
    var habitRawValue: String
    
    var habit: HabitTypeProtocol? {
        switch timeSlot {
        case .morning:
            return MorningHabitType(rawValue: habitRawValue)
        case .afternoon:
            return AfternoonHabitType(rawValue: habitRawValue)
        }
    }
    
    var quantity: Int? = nil
    var startTime: Date? = nil
    var endTime: Date? = nil
    
    init(
        date: Date,
        timeSlot: TimeSlot,
        habitRawValue: String
        ) {
        self.date = date
        self.timeSlot = timeSlot
        self.habitRawValue = habitRawValue
    }
}

extension Habit {
    static var habitStub01: Habit {
        .init(date: Date(), timeSlot: .morning, habitRawValue: MorningHabitType.drinkWater.rawValue)
    }
    
    static var habitStub02: Habit {
        .init(date: Date(), timeSlot: .morning, habitRawValue: MorningHabitType.drinkWater.rawValue)
    }
}
