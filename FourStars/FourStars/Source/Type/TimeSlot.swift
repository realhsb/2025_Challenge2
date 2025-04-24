//
//  TaskTimeType.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation

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
    
    var timeRange: (start: DateComponents, end: DateComponents)? {
        switch self {
        case .morning:
            return (start: DateComponents(hour: 6, minute: 0), end: DateComponents(hour: 10, minute: 59, second: 59))
        case .afternoon:
            return (start: DateComponents(hour: 11, minute: 0), end: DateComponents(hour: 16, minute: 59, second: 59))
        case .evening:
            return (start: DateComponents(hour: 17, minute: 0), end: DateComponents(hour: 23, minute: 59, second: 59))
        case .extra:
            return (start: DateComponents(hour: 0, minute: 0), end: DateComponents(hour: 23, minute: 59, second: 59))
        }
    }
    
/// 현재 시각이 이 시간대에 속하는지?
    func contains(_ date: Date, calendar: Calendar = .current) -> Bool {
        guard let range = timeRange,
            let startDate = calendar.date(bySettingHour: range.start.hour ?? 0,
                                        minute: range.start.minute ?? 0,
                                        second: 0, of: date),
            let endDate = calendar.date(bySettingHour: range.end.hour ?? 0,
                                            minute: range.end.minute ?? 0,
                                            second: 0, of: date)
        else {
            return false
        }
        
        // 디버깅용 출력
//         print("Range: \(startDate) ~ \(endDate)")
//         print("Now: \(date)")
        return (startDate ... endDate).contains(date)
    }
}
