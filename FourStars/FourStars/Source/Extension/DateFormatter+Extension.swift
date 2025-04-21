//
//  DateFormatter+Extension.swift
//  FourStars
//
//  Created by Soop on 4/16/25.
//

import Foundation

extension DateFormatter {
    static let stampDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM년 dd일"
        return formatter
    }()
}
