//
//  MorningHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class MorningHabit: HabitType {
    var timeSlot: TimeSlot = TimeSlot.morning
    var habit: MorningHabitType?
    
    @Relationship
    var baseHabit: BaseHabit

    init(
        habit: MorningHabitType? = nil,
        baseHabit: BaseHabit
    ) {
        self.habit = habit
        self.baseHabit = baseHabit
    }
}

enum MorningHabitType: CaseIterable {
    case drinkWater(count: Int)
    case wakeUp(time: Int)
    case stretch

//    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .wakeUp(time: let time):
            return "\(time)시 기상"
        case .drinkWater(count: let count):
            return "\(count)잔 물 마시기"
        case .stretch:
            return "스트레칭"
        }
    }
}

extension MorningHabit {
    static var stub01: MorningHabit = .init(baseHabit: .stub01)
    static var stub02: MorningHabit = .init(habit: .drinkWater(count: 1), baseHabit: .stub01)
}
    
//    var id: String { rawValue } // Identifiable 프로토콜을 따를 때 사용, enum에서는 단순 반복만을 위해서 이렇게 작성, 보통은 UUID() 삽입
    
//    func displayName(quantity: Int?, start: Date?, end: Date?) -> String {
//        switch self {
//        case .wakeUp:
//            // TODO: - 기상 시각 입력 하기
//            return "기상"
//        case .drinkWater:
//            return "\(quantity ?? 1)잔 물 마시기"
//        case .stretch:
//            return "스트레칭"
//        }
//    }
//}

//extension MorningHabit {
//    static var stub01: MorningHabit = .init(habit: .drinkWater, quantity: nil, startTime: nil, endTime: nil)
//}
