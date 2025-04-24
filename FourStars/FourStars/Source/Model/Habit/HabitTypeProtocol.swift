//
//  HabitTypeProtocol.swift
//  FourStars
//
//  Created by Soop on 4/23/25.
//

import Foundation

protocol HabitTypeProtocol: RawRepresentable, Equatable, Codable {
    var description: String { get }
    var isNone: Bool { get }
}
