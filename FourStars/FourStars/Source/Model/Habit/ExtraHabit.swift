//
//  ExtraHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class ExtraHabit: HabitType {
    var timeSlot: TimeSlot = TimeSlot.extra
    var habit: ExtraHabit?
    
    @Relationship
    var baseHabit: BaseHabit

    init(
        habit: ExtraHabit? = nil,
        baseHabit: BaseHabit
    ) {
        self.habit = habit
        self.baseHabit = baseHabit
    }
}

enum ExtraHabitType: String, CaseIterable, Identifiable, Codable {
    case gratitude = "감사 표현"
    case noPhone = "폰 사용 줄이기"
    case deepBreath = "심호흡"
    
    var id: String { rawValue }
    
}

extension ExtraHabit {
    static var stub01: ExtraHabit = .init(baseHabit: .stub01)
}
