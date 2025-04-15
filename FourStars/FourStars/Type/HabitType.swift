//
//  MorningHabitType.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

enum MorningHabitType: String, CaseIterable, Identifiable, Codable {
    case drinkWater = "물"
    case wakeUp = "기상"
    case stretch = "스트레칭"
    
    var id: String { rawValue } // Identifiable 프로토콜을 따를 때 사용, enum에서는 단순 반복만을 위해서 이렇게 작성, 보통은 UUID() 삽입
}

enum AfternoonHabitType: String, CaseIterable, Identifiable, Codable {
    case walk = "산책"
    case read = "책"
    case meditate = "명상"
    
    var id: String { rawValue }
}

enum EveningHabitType: String, CaseIterable, Identifiable, Codable {
    case reflect = "하루 회고"
    case journal = "일기 쓰기"
    case tidyUp = "정리 정돈"
    
    var id: String { rawValue }
}

enum ExtraHabitType: String, CaseIterable, Identifiable, Codable {
    case gratitude = "감사 표현"
    case noPhone = "폰 사용 줄이기"
    case deepBreath = "심호흡"
    
    
    var id: String { rawValue }
}
