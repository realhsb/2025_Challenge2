//
//  MorningHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class MorningHabit: BaseHabit {
    var habit: MorningHabitType?

    init(
        habit: MorningHabitType? = nil,
        quantity: Int? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil
    ) {
        self.habit = habit
        super.init(
            timeSlot: .morning,
            quantity: quantity,
            startTime: startTime,
            endTime: endTime
        )
    }
}

enum MorningHabitType: String, CaseIterable, Identifiable, Codable {
    case drinkWater = "물"
    case wakeUp = "기상"
    case stretch = "스트레칭"
    
    var id: String { rawValue } // Identifiable 프로토콜을 따를 때 사용, enum에서는 단순 반복만을 위해서 이렇게 작성, 보통은 UUID() 삽입
    
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
}

extension MorningHabit {
    static var stub01: MorningHabit = .init(habit: .drinkWater, quantity: nil, startTime: nil, endTime: nil)
}
