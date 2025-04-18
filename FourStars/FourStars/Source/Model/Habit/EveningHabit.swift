//
//  EveningHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class EveningHabit: HabitType {
    var timeSlot: TimeSlot = TimeSlot.evening
    var habit: EveningHabitType?
    
    @Relationship
    var baseHabit: BaseHabit

    init(
        habit: EveningHabitType? = nil,
        baseHabit: BaseHabit
    ) {
        self.habit = habit
        self.baseHabit = baseHabit
    }
}

enum EveningHabitType: String, CaseIterable, Identifiable, Codable {
    case reflect = "하루 회고"
    case journal = "일기 쓰기"
    case tidyUp = "정리 정돈"

    var id: String { rawValue }
}

extension EveningHabit {
    static var stub01: EveningHabit = .init(baseHabit: .stub01)
}
