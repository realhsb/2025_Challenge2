//import Foundation
//import ComposableArchitecture
//import SwiftData
//
//@Reducer
//struct HabitFeature {
//    @Dependency(\.modelContext) var modelContext
//    
//    struct State: Equatable {
//        var dailyHabits: [DailyHabit] = []
//        var selectedDate: Date = Date()
//        var isLoading: Bool = false
//    }
//    
//    enum Action {
//        case addDailyHabit(DailyHabit)
//        case completeMorningHabit(DailyHabit)
//        case completeAfternoonHabit(DailyHabit)
//        case completeEveningHabit(DailyHabit)
//        case completeExtraHabit(DailyHabit)
//        case loadDailyHabits
//        case dailyHabitsLoaded([DailyHabit])
//        case selectDate(Date)
//        case setLoading(Bool)
//    }
//    
//    var body: some ReducerOf<Self> {
//        Reduce { state, action in
//            switch action {
//            case let .addDailyHabit(dailyHabit):
//                modelContext.insert(dailyHabit)
//                try? modelContext.save()
//                state.dailyHabits.append(dailyHabit)
//                return .none
//                
//            case let .completeMorningHabit(dailyHabit):
//                if let index = state.dailyHabits.firstIndex(where: { $0.uuid == dailyHabit.uuid }) {
//                    state.dailyHabits[index].morningHabit?.isCompleted = true
//                    try? modelContext.save()
//                }
//                return .none
//                
//            case let .completeAfternoonHabit(dailyHabit):
//                if let index = state.dailyHabits.firstIndex(where: { $0.uuid == dailyHabit.uuid }) {
//                    state.dailyHabits[index].afternoonHabit?.isCompleted = true
//                    try? modelContext.save()
//                }
//                return .none
//                
//            case let .completeEveningHabit(dailyHabit):
//                if let index = state.dailyHabits.firstIndex(where: { $0.uuid == dailyHabit.uuid }) {
//                    state.dailyHabits[index].eveningHabit?.isCompleted = true
//                    try? modelContext.save()
//                }
//                return .none
//                
//            case let .completeExtraHabit(dailyHabit):
//                if let index = state.dailyHabits.firstIndex(where: { $0.uuid == dailyHabit.uuid }) {
//                    state.dailyHabits[index].extraHabit?.isCompleted = true
//                    try? modelContext.save()
//                }
//                return .none
//                
//            case .loadDailyHabits:
//                state.isLoading = true
//                let descriptor = FetchDescriptor<DailyHabit>(
//                    predicate: #Predicate<DailyHabit> { dailyHabit in
//                        Calendar.current.isDate(dailyHabit.date, inSameDayAs: state.selectedDate)
//                    }
//                )
//                do {
//                    let dailyHabits = try modelContext.fetch(descriptor)
//                    return .send(.dailyHabitsLoaded(dailyHabits))
//                } catch {
//                    state.isLoading = false
//                    return .none
//                }
//                
//            case let .dailyHabitsLoaded(dailyHabits):
//                state.dailyHabits = dailyHabits
//                state.isLoading = false
//                return .none
//                
//            case let .selectDate(date):
//                state.selectedDate = date
//                return .send(.loadDailyHabits)
//                
//            case let .setLoading(isLoading):
//                state.isLoading = isLoading
//                return .none
//            }
//        }
//    }
//} 
