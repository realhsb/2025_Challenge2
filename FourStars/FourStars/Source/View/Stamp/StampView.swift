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

    
//    @Binding var isPresentSheet: Bool
    @Binding var timeSlot: TimeSlot?

    @Binding var isEditing: Bool

    var body: some View {
        VStack(spacing: 0) {
            Text(DateFormatter.stampDateFormatter.string(from: todayDailyStamp.date))
            Group {
                if isEditing {
                    isEditingView
                } else {
                    isCheckingView
                }
                
            }
            .padding(.horizontal, 50)
            .padding(.vertical, 40)
            .background(Color.black)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
    
    // 인증모드
    var isCheckingView: some View {
        VStack(spacing: -40) {
                       
            Button {
                todayDailyStamp.morningResult.status = .success
                try? context.save()
            } label: {
                todayDailyStamp.morningResult.star.image
                    .overlay {
                        if todayDailyStamp.morningResult.status == .notDone {
                            Text(myHabit.morningHabit.description)
                        }
                    }
            }
            .padding(.leading, 60)
            
            Button {
                todayDailyStamp.afternoonResult.status = .success
                try? context.save()
                print("StampView - isCheckingView - afternoon")
            } label: {
                todayDailyStamp.afternoonResult.star.image
                    .overlay {
                        if todayDailyStamp.afternoonResult.status == .notDone {
                            Text(myHabit.afternoonHabit.description)
                        }
                    }
            }
            .padding(.leading, -60)
            
            Button {
                todayDailyStamp.eveningResult.status = .success
                try? context.save()
                print("StampView - isCheckingView - evening")
            } label: {
                todayDailyStamp.eveningResult.star.image
                    .overlay {
                        if todayDailyStamp.eveningResult.status == .notDone {
                            Text(myHabit.eveningHabit.description)
                        }
                    }
            }
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
                        }
                    }
            }
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
    }
}

#Preview {
    StampView(myHabit: MyHabit(date: Date()), todayDailyStamp: .stub01, timeSlot: .constant(.morning), isEditing: .constant(false))
}
