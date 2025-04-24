//
//  HabitType.swift
//  FourStars
//
//  Created by Soop on 4/18/25.
//

import Foundation
import SwiftUI

enum MorningHabitType: String, Codable, CaseIterable, HabitTypeProtocol {
    case none
    case drinkWater
    case wakeUp
    case stretch
}

extension MorningHabitType {
    
    var isNone: Bool { self == .none }
    
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
    
    var image: Image {
        switch self {
        case .none:
            return Image(.iconNone)
        case .drinkWater:
            return Image(.iconWater)
        case .wakeUp:
            return Image(.iconWater)
        case .stretch:
            return Image(.iconWater)
        }
    }
}

enum AfternoonHabitType: String, Codable, CaseIterable, HabitTypeProtocol {
    case none
    case walk
    case read
    case meditate
}

extension AfternoonHabitType {
    
    var isNone: Bool { self == .none }
    
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
    
    var image: Image {
        switch self {
        case .none:
            return Image(.iconNone)
        case .walk:
            return Image(.iconNone)
        case .read:
            return Image(.iconNone)
        case .meditate:
            return Image(.iconNone)
        }
    }
}

enum EveningHabitType: String, Codable, CaseIterable, HabitTypeProtocol {
    case none
    case reflect
    case journal
    case tidyUp
}

extension EveningHabitType {
    
    var isNone: Bool { self == .none }
    
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
    
    var image: Image {
        switch self {
        case .none:
            return Image(.iconNone)
        case .reflect:
            return Image(.iconNone)
        case .journal:
            return Image(.iconNone)
        case .tidyUp:
            return Image(.iconNone)
        }
    }
}

enum ExtraHabitType: String, Codable, CaseIterable, HabitTypeProtocol {
    case none = "기타"
    case gratitude = "감사 표현"
    case noPhone = "폰 사용 줄이기"
    case deepBreath = "심호흡"
}

extension ExtraHabitType {
    
    var isNone: Bool { self == .none }
    
    var description: String {
        rawValue
    }
    
    var image: Image {
        switch self {
        case .none:
            return Image(.iconNone)
        case .gratitude:
            return Image(.iconNone)
        case .noPhone:
            return Image(.iconNone)
        case .deepBreath:
            return Image(.iconNone)
        }
    }
}
