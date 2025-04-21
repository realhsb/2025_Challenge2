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
    var quantity: Int? = nil
    var startTime: Date? = nil
    var endTime: Date? = nil

    init(
        quantity: Int?,
        startTime: Date?,
        endTime: Date?
    ) {
        self.quantity = quantity
        self.startTime = startTime
        self.endTime = endTime
    }
}

extension BaseHabit {
    static var stub01: BaseHabit = .init(quantity: nil, startTime: nil, endTime: nil)
}
