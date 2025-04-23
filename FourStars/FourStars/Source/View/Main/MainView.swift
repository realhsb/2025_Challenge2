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
    @State var isPopUpShow: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                
                StampView(myHabit: habits.first ?? .stub01, todayDailyStamp: todayDailyStamp, timeSlot: $timeSlot, isEditing: $isEditing, isPopUpShow: $isPopUpShow)
                
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
                
                if !isEditing {
                    Button {
                        isEditing.toggle()
                    } label: {
                        Text("수정하기")
                    }
                }
            }
            
            if isPopUpShow {
                popUpView
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
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    switch timeSlot {
                    case .morning:
                        ForEach(MorningHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.morningHabit = type
                            } label: {
                                VStack {
                                    type.image
                                    Text(type.description)
                                        .foregroundStyle(Color.primary)
                                }
                            }
                        }
                    case .afternoon:
                        ForEach(AfternoonHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.afternoonHabit = type
                            } label: {
                                Text(type.description)
                                    .foregroundStyle(Color.primary)
                            }
                        }
                    case .evening:
                        ForEach(EveningHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.eveningHabit = type
                            } label: {
                                Text(type.description)
                                    .foregroundStyle(Color.primary)
                            }
                        }
                    case .extra:
                        ForEach(ExtraHabitType.allCases, id: \.self) { type in
                            Button {
                                self.habits.first?.extraHabit = type
                            } label: {
                                Text(type.description)
                                    .foregroundStyle(Color.primary)
                            }
                        }
                    }
                }
            }
            .padding(.leading, 10)
            .presentationDragIndicator(.hidden)
            .presentationDetents([.fraction(2)])
        }
    }
    
    @ViewBuilder
    var popUpView: some View {
        ZStack {
            Color.basicBlack.opacity(0.2).ignoresSafeArea()
            VStack {
                
                Star.errorYellow.image
                Text("해당 시간대가 아닙니다!")
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color.textGray)
                
                Button {
                    isPopUpShow = false
                } label: {
                    Text("확인")
                        .foregroundStyle(Color.primary)
                }
                .padding(.vertical, 4)
            }
            .frame(width: 240)
            .padding()
            .background(Color.basicWhite)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    MainView(isPresentSheet: false)
}
