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
    var uuid: String = UUID().uuidString
    var timeSlot: TimeSlot = TimeSlot.morning
    var habit: EveningHabitType?
    
    var quantity: Int?
    var startTime: Date?
    var endTime: Date?
    
    init(
        habit: EveningHabitType? = nil,
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

enum EveningHabitType: String, CaseIterable, Identifiable, Codable {
    case reflect = "하루 회고"
    case journal = "일기 쓰기"
    case tidyUp = "정리 정돈"

    var id: String { rawValue }
}

extension EveningHabit {
    static var stub01: EveningHabit = .init(habit: .journal, quantity: nil, startTime: nil, endTime: nil)
}
