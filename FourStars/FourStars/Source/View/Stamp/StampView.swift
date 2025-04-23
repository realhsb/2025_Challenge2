//
//  StampView.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import SwiftUI
import SwiftData

struct StampView: View {
    @Query(sort: \DailyStamp.date) private var dailyStamps: [DailyStamp]
    @Query private var myHabits: [MyHabit]
    
    @Environment(\.modelContext) private var context
    
    @Bindable var myHabit: MyHabit
    @Bindable var todayDailyStamp: DailyStamp

    @Binding var timeSlot: TimeSlot?
    @Binding var isEditing: Bool
    @Binding var isPopUpShow: Bool

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                
                Text(DateFormatter.stampDateFormatter.string(from: todayDailyStamp.date))
                    .frame(maxWidth: 400)
                    .padding(.vertical, 10)
                    .background(Color.primaryLight)
                
                    .frame(alignment: .leading)
                Group {
                    if isEditing {
                        isEditingView
                    } else {
                        isCheckingView
                    }
                    
                }
                .frame(maxWidth: 400)
                .padding(.vertical, 40)
                .background(Color.primary)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 40)
        }
    }
    
    // 인증모드
    var isCheckingView: some View {
        VStack(spacing: -40) {
            ForEach(Array(todayDailyStamp.habitResults.enumerated()), id: \.element.timeSlot) { index, today in
                Button {
//                    let now = Date()
//                    print(today)
//                    print(today.status)
                    today.status = .success
                    try? context.save()
//                    isPopUpShow = true
                    
                    print(today.timeSlot.contains(Date()))
                    print("\(today.timeSlot) 인증 성공!")
//                    print("\(today.timeSlot.timeRange)")
                } label: {
                    today.star.image
                        .overlay {
                            if today.status == .notDone {
                                VStack {
                                    Text(myHabit.habitTypeMap[index].value.description)
                                        .foregroundStyle(Color.textGray)
                                    if !today.timeSlot.contains(Date()) {
                                        Text("인증 가능 시간대가 아닙니다!")
                                    }
                                }
                            }
                            
                        }
                }
                .disabled(!today.timeSlot.contains(Date()) || today.status == .success)
                .padding(index % 2 == 0 ? .leading : .trailing, 60)
            }
        }
    }
    
    // 편집모드
    var isEditingView: some View {
        VStack(spacing: -40) {
            ForEach(Array(myHabit.habitTypeMap.enumerated()), id: \.element.slot) { index, today in
                let slot = today.slot
                let habit = today.value
                Button {
                    timeSlot = slot
                } label: {
                    Star.noneText.image
                        .overlay {
                            Text(habit.description)
                        }
                }
                .padding(index % 2 == 0 ? .leading : .trailing, 60)
            }
        }
        .foregroundStyle(Color.textGray)
    }

}

#Preview {
    StampView(myHabit: MyHabit(date: Date()), todayDailyStamp: .stub01, timeSlot: .constant(.morning), isEditing: .constant(false), isPopUpShow: .constant(false))
}
