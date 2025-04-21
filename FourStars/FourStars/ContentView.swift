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
    @Environment(\.modelContext) private var context

    var body: some View {
        MainView()
            .onAppear {
                // 기본 습관 데이터가 없을 경우
                // 데이터 저장 -> 매번 앱을 실행할 때마다 확인해도 되는 건지...
                if myHabit.isEmpty {
                    let myHabit = MyHabit(date: Date())
                    context.insert(myHabit)
                    print("myHabit created: \(myHabit)")
                }
            }
    }
}

#Preview {
    ContentView()
}
