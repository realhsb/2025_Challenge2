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
    var quantity: Int?
    var startTime: Date?
    var endTime: Date?

    init(
        quantity: Int? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil
    ) {
        self.quantity = quantity
        self.startTime = startTime
        self.endTime = endTime
    }
}
