//
//  HabitResult.swift
//  FourStars
//
//  Created by Soop on 4/17/25.
//

import SwiftData
import Foundation

@Model
class HabitResult {

    var status: HabitStatus = HabitStatus.notDone
    var star: Star

    init(
        status: HabitStatus
    ) {
        
        switch status {
        case .notDone:
            self.star = Star.gray
        case .failure:
            self.star = Star.red
        case .success:
            self.star = Star.successColors.randomElement() ?? Star.yellow
        }
    }
}
