//
//  FourStarsApp.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import SwiftUI
import SwiftData
//import ComposableArchitecture

@main
struct FourStarsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            
            MorningHabit.self,
            AfternoonHabit.self,
            EveningHabit.self,
            ExtraHabit.self,
            DailyHabit.self,
            
            
            HabitResult.self,
            DailyStamp.self,
            TotalStamp.self
        ])
    }
}
