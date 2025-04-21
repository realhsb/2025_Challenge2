//
//  HabitType.swift
//  FourStars
//
//  Created by Soop on 4/18/25.
//

import Foundation

enum MorningHabitType: String, Codable, CaseIterable, Hashable {
    
    case none
    case drinkWater
    case wakeUp
    case stretch
}

extension MorningHabitType {
    
    var description: String {
        switch self {
        case .none:
            return "아침"
        case .wakeUp:
            return "기상"
        case .drinkWater:
            return "물 마시기"
        case .stretch:
            return "스트레칭"
        }
    }
}

enum AfternoonHabitType: String, CaseIterable, Hashable, Codable {
    case none
    case walk
    case read
    case meditate
}

extension AfternoonHabitType {
    var description: String {
        switch self {
        case .none:
            return "점심"
        case .walk:
            return "산책"
        case .read:
            return "책 읽기"
        case .meditate:
            return "명상"
        }
    }
}

enum EveningHabitType: String, CaseIterable, Hashable, Codable {
    case none
    case reflect
    case journal
    case tidyUp
}

extension EveningHabitType {
    
    var description: String {
        switch self {
        case .none:
            return "저녁"
        case .reflect:
            return "하루 회고"
        case .journal:
            return "일기 쓰기"
        case .tidyUp:
            return "정리 정돈"
        }
    }
}

enum ExtraHabitType: String, CaseIterable, Hashable, Codable {
    case none = "기타"
    case gratitude = "감사 표현"
    case noPhone = "폰 사용 줄이기"
    case deepBreath = "심호흡"
}

extension ExtraHabitType {
    var description: String {
        rawValue
    }
}
