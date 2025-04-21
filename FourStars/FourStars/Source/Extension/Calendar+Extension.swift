//
//  Calendar+Extension.swift
//  FourStars
//
//  Created by Soop on 4/21/25.
//

import Foundation

extension Date {
    
    /// Date 년월일로 저장. 시분초는 00으로
    var strippedTime: Date {
            Calendar.current.startOfDay(for: self)
    }
    
    /// 오늘 날짜에 해당되는 날짜 Date 가져오기 (== 통해 비교하면 시분초 때문에 false 뜸)
    func isSameDay(as other: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: other)
    }
}
