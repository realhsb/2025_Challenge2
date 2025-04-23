//
//  DailyStamp.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import Foundation
import SwiftData

@Model
class DailyStamp {
    var date: Date

//    @Relationship var morningResult: HabitResult
//    @Relationship var afternoonResult: HabitResult
//    @Relationship var eveningResult: HabitResult
//    @Relationship var extraResult: HabitResult
    
    @Relationship var results: [HabitResult] = []
    
    var habitResults: [HabitResult] {
            TimeSlot.allCases.map { slot in
                results.first { $0.timeSlot == slot } ?? HabitResult(timeSlot: slot, status: .notDone)
            }
        }

    init(date: Date) {
        self.date = date.strippedTime // 시분초 00으로 설정
//        self.morningResult = HabitResult(timeSlot: .morning, status: .notDone)
//        self.afternoonResult = HabitResult(timeSlot: .afternoon, status: .notDone)
//        self.eveningResult = HabitResult(timeSlot: .evening, status: .notDone)
//        self.extraResult = HabitResult(timeSlot: .extra, status: .notDone)
    }
}

extension DailyStamp {
    static var stub01: DailyStamp = .init(date: Date().strippedTime)
}
