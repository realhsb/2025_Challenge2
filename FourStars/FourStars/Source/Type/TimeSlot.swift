//
//  TaskTimeType.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

enum TimeSlot: String, Codable, Identifiable, CaseIterable {
    case morning
    case afternoon
    case evening
    case extra
}

extension TimeSlot {
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
            case .morning: return "아침"
            case .afternoon: return "점심"
            case .evening: return "저녁"
            case .extra: return "기타"
        }
    }
}
