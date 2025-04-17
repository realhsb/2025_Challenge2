//
//  BaseHabit.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import Foundation
import SwiftData

@Model
class BaseHabit {
    var uuid: String
    var timeSlot: TimeSlot
    var quantity: Int?
    var startTime: Date?
    var endTime: Date?

    init(
        uuid: String = UUID().uuidString,
        timeSlot: TimeSlot,
        quantity: Int? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil
    ) {
        self.uuid = uuid
        self.timeSlot = timeSlot
        self.quantity = quantity
        self.startTime = startTime
        self.endTime = endTime
    }
}
