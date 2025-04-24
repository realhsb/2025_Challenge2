//
//  ContentView.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var myHabit: [MyHabit]
    @Query private var habitResults: [HabitResult]
    @Environment(\.modelContext) private var context

    var body: some View {
        MainView()
            .onAppear {
                // 1. 기본 습관 데이터가 없을 경우
                if myHabit.isEmpty {
                    let myHabit = MyHabit(date: Date())
                    context.insert(myHabit)
                    print("myHabit created: \(myHabit)")
                }
                
                // 2. 오늘 날짜 기준의 DailyStamp 없으면 생성
                    let today = Date().strippedTime
                    let existingStamp = try? context.fetch(FetchDescriptor<DailyStamp>(
                        predicate: #Predicate { $0.date == today }
                    )).first
                    
                    if existingStamp == nil {
                        let newStamp = DailyStamp(date: today)
                        // 초기 HabitResult 4개 생성 및 추가
                        TimeSlot.allCases.forEach { slot in
                            let result = HabitResult(timeSlot: slot, status: .notDone)
                            newStamp.results.append(result)
                        }
                        context.insert(newStamp)
                        print("DailyStamp created for: \(today)")
                    }
            }
    }
}

#Preview {
    ContentView()
}
