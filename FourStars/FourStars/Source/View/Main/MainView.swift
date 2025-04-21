//
//  MainView.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import Foundation
import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var habits: [MyHabit]
    @Query private var dailyStamps: [DailyStamp]
    var todayDailyStamp: DailyStamp {
        let today: Date = Date().strippedTime
        return dailyStamps.filter({ $0.date == today }).first ?? .stub01
    }
    
    @State var isEditing = false
    @State var isPresentSheet = false
    @State var timeSlot: TimeSlot? = nil

    
    var body: some View {
        VStack {
            
            StampView(myHabit: habits.first ?? .stub01, todayDailyStamp: todayDailyStamp, timeSlot: $timeSlot, isEditing: $isEditing)
            
            if isEditing {
                Text("수정 모드")
                
                Button {
                    try? self.modelContext.save()
                    isEditing.toggle()
                } label: {
                    Text("습관 저장")
                    
                }
            } else {
                Text("인증 모드")
            }
        }
        .onAppear {
            if let habit = habits.first {
                if (!habit.isSaved()) {
                    self.isEditing = true
                    print(isEditing)
                }
            }
        }
        .sheet(item: $timeSlot) { timeSlot in // item이 바뀌면 감지하고 sheet ㄷ두두두등장
            ScrollView {
                VStack {
                    switch timeSlot {
                    case .morning:
                        ForEach(MorningHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.morningHabit = type
                            } label: {
                                Text(type.description)
                            }
                        }
                    case .afternoon:
                        ForEach(AfternoonHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.afternoonHabit = type
                            } label: {
                                Text(type.description)
                            }
                        }
                    case .evening:
                        ForEach(EveningHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.eveningHabit = type
                            } label: {
                                Text(type.description)
                            }
                        }
                    case .extra:
                        ForEach(ExtraHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.extraHabit = type
                            } label: {
                                Text(type.description)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var popUpView: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Text("확인")
                }
                
                Button {
                    
                } label: {
                    Text("취소")
                }
            }
        }
    }
}

#Preview {
    MainView(isPresentSheet: false)
}
