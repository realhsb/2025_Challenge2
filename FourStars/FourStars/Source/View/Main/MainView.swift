//
//  MainView.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var habits: [MyHabit]
    
    @State var isEditing = false
    @State var isPresentSheet = false
    @State var timeSlot: TimeSlot? = nil
    
    var body: some View {
        VStack {
            if isEditing {
                Text("수정 모드")
                StampView(myHabit: habits.first ?? .stub01, isPresentSheet: $isPresentSheet, timeSlot: $timeSlot, isEditing: true)
            } else {
                Text("인증 모드")
                StampView(myHabit: habits.first ?? .stub01, isPresentSheet: $isPresentSheet, timeSlot: $timeSlot, isEditing: false)
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
        .sheet(item: $timeSlot) { timeSlot in
            ScrollView {
                VStack {
                    switch timeSlot {
                    case .morning:
                        ForEach(MorningHabitType.allCases, id: \.self) { type in
                            Button {
//                                let morningHabit =
//                                self.habit.morningHabit!.habit = type
                            } label: {
                                Text(type.description)
                            }
                        }
                    case .afternoon:
                        ForEach(AfternoonHabitType.allCases, id: \.self) { type in
                            Text(type.description)
                        }
                    case .evening:
                        ForEach(EveningHabitType.allCases, id: \.self) { type in
                            Text(type.description)
                        }
                    case .extra:
                        ForEach(ExtraHabitType.allCases, id: \.self) { type in
                            Text(type.description)
                        }
                    case nil:
                        Text("nil")
                    }
                
                }
            }
        }
    }
}

#Preview {
    MainView(isPresentSheet: false)
}
