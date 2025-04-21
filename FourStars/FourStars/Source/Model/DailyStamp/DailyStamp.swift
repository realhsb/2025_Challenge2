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

    @Relationship var morningResult: HabitResult
    @Relationship var afternoonResult: HabitResult
    @Relationship var eveningResult: HabitResult
    @Relationship var extraResult: HabitResult

    init(date: Date) {
        self.date = date
        self.morningResult = HabitResult(status: .notDone)
        self.afternoonResult = HabitResult(status: .notDone)
        self.eveningResult = HabitResult(status: .notDone)
        self.extraResult = HabitResult(status: .notDone)
    }
}

extension DailyStamp {
    static var stub01: DailyStamp = .init(date: Date().strippedTime)
}
