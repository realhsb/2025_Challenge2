//
//  ExtraHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class ExtraHabit: HabitDetail {
    var uuid: String = UUID().uuidString
    var timeSlot: TimeSlot = TimeSlot.morning
    var habit: ExtraHabitType?
    
    var quantity: Int?
    var startTime: Date?
    var endTime: Date?
    
    init(
        habit: ExtraHabitType? = nil,
        quantity: Int? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil
    ) {
        self.timeSlot = timeSlot
        self.habit = habit
        self.quantity = quantity
        self.startTime = startTime
        self.endTime = endTime
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
