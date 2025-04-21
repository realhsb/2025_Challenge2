//
//  ExtraHabit.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftData

@Model
class ExtraHabit {
    var timeSlot: TimeSlot = TimeSlot.extra
    var habitString: String?
    
    @Relationship
    var baseHabit: BaseHabit

    init(
        habitString: String? = nil,
        baseHabit: BaseHabit
    ) {
        self.habitString = habitString
        self.baseHabit = baseHabit
    }
}



extension ExtraHabit {
//    var description: String {
//        rawValue
//    }
    
    static var stub01: ExtraHabit = .init(baseHabit: .stub01)
}
