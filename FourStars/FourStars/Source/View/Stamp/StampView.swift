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
                //            .padding(.horizontal, 50)
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
            let now = 
            Button {
                let now = Date()
                if TimeSlot.morning.contains(now) {
                    print("아침 인증 성공! 😎")
                    todayDailyStamp.morningResult.status = .success
                    try? context.save()
                } else {
                    print("아침 인증 실패!")
                    isPopUpShow = true
                }
                
            } label: {
                todayDailyStamp.morningResult.star.image
                    .overlay {
                        if todayDailyStamp.morningResult.status == .notDone {
                            Text(myHabit.morningHabit.description)
                                .foregroundStyle(Color.textGray)
                        }
                    }
            }
            .disabled(myHabit.morningHabit == .none)
            .padding(.leading, 60)
            
            Button {
                let now = Date()
                if TimeSlot.morning.contains(now) {
                    print("점심 인증 성공! 😎")
                    todayDailyStamp.afternoonResult.status = .success
                    try? context.save()
                } else {
                    print("점심 인증 실패!")
                    isPopUpShow = true
                }
                
                print("StampView - isCheckingView - afternoon")
            } label: {
                todayDailyStamp.afternoonResult.star.image
                    .overlay {
                        if todayDailyStamp.afternoonResult.status == .notDone {
                            Text(myHabit.afternoonHabit.description)
                                .foregroundStyle(Color.textGray)
                        }
                    }
            }
            .disabled(myHabit.afternoonHabit == .none)
            .padding(.trailing, 60)
            
            Button {
                todayDailyStamp.eveningResult.status = .success
                try? context.save()
                print("StampView - isCheckingView - evening")
            } label: {
                todayDailyStamp.eveningResult.star.image
                    .overlay {
                        if todayDailyStamp.eveningResult.status == .notDone {
                            Text(myHabit.eveningHabit.description)
                                .foregroundStyle(Color.textGray)
                        }
                    }
            }
            .disabled(myHabit.eveningHabit == .none)
            .padding(.leading, 60)
            
            Button {
                todayDailyStamp.extraResult.status = .success
                try? context.save()
                print("StampView - isCheckingView - extra")
            } label: {
                todayDailyStamp.extraResult.star.image
                    .overlay {
                        if todayDailyStamp.extraResult.status == .notDone {
                            Text(myHabit.extraHabit.description)
                                .foregroundStyle(Color.textGray)
                        }
                    }
            }
            .disabled(myHabit.extraHabit == .none)
            .padding(.leading, -60)
            
        }
    }
    
    // 편집모드
    var isEditingView: some View {
        VStack(spacing: -40) {
                       
            Button {
                timeSlot = .morning
                print("StampView - isEditingView - morning")
            } label: {
                Star.noneText.image
                    .overlay {
                        Text(myHabit.morningHabit.description)
                    }
            }
            .padding(.leading, 60)
            
            Button {
                timeSlot = .afternoon
                print("StampView - isEditingView - afternoon")
            } label: {
                Star.noneText.image
                    .overlay {
                        Text(myHabit.afternoonHabit.description)
                    }
            }
            .padding(.leading, -60)
            
            Button {
                timeSlot = .evening
                print("StampView - isEditingView - evening")
            } label: {
                Star.noneText.image
                    .overlay {
                        Text(myHabit.eveningHabit.description)
                    }
            }
            .padding(.leading, 60)
            
            Button {
                timeSlot = .extra
                print("StampView - isEditingView - extra")
            } label: {
                Star.noneText.image
                    .overlay {
                        Text(myHabit.extraHabit.description)
                    }
            }
            .padding(.leading, -60)
            
        }
        .foregroundStyle(Color.textGray)
    }

}

#Preview {
    StampView(myHabit: MyHabit(date: Date()), todayDailyStamp: .stub01, timeSlot: .constant(.morning), isEditing: .constant(false), isPopUpShow: .constant(false))
}
