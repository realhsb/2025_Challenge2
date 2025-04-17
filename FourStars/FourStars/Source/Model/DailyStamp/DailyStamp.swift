//
//  DailyStamp.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import Foundation
import SwiftData

//@Model
//class DailyStamp {
//    var todayDate: Date
//
//    var morningResult: HabitResult
//    var afternoonResult: HabitResult
//    var eveningResult: HabitResult
//    var extraResult: HabitResult
//
//    init(todayDate: Date) {
//        self.todayDate = todayDate
//        self.morningResult = HabitResult(status: .notDone)
//        self.afternoonResult = HabitResult(status: .notDone)
//        self.eveningResult = HabitResult(status: .notDone)
//        self.extraResult = HabitResult(status: .notDone)
//    }
//}

@Model
class DailyStamp {
    var todayDate: Date
    var results: [TimeSlot : HabitResult]
    
    init(
        todayDate: Date,
        results: [TimeSlot : HabitResult] = Dictionary(uniqueKeysWithValues: TimeSlot.allCases.map { ($0, HabitResult(status: .notDone)) })
    ) {
        self.todayDate = todayDate
        self.results = results
    }
}

