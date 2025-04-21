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
    
    @Binding var isPresentSheet: Bool
    @Binding var timeSlot: TimeSlot?

    var isEditing: Bool

    var body: some View {
        VStack(spacing: 0) {
            
            Text(myHabit.date.description)
            
            Group {
                if isEditing {
                    isEditingView
                } else {
                    
                }
                
            }
            .padding(.horizontal, 50)
            .padding(.vertical, 40)
            .background(Color.black)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
    
    // 편집모드
    var isEditingView: some View {
        VStack(spacing: -40) {
                       
            Button {
                timeSlot = .morning
                isPresentSheet.toggle()
//                timeSlot = .morning
                print("StampView - isEditingView - morning")
            } label: {
                Star.noneText.image
                    .overlay {
                        Text(myHabit.morningHabit.description)
                    }
            }
            .padding(.leading, 60)
        }
    }
}

#Preview {
    StampView(myHabit: MyHabit(date: Date()), isPresentSheet: .constant(false), timeSlot: .constant(.morning), isEditing: true)
}
