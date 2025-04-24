//
//  Font+Extension.swift
//  FourStars
//
//  Created by Soop on 4/23/25.
//

import SwiftUI

extension Font {
    static let seoulHangangB16: Font = .custom("SeoulHangangB", size: 16)
}

/// 폰트가 추가되었는지 확인
func checkFontFile() {
    for fontFamily in UIFont.familyNames {
        for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
            print(fontName)
        }
    }
}

/// 프레임을 폰트 높이에 맞추기
func heightForFontSize(_ size: CGFloat) -> CGFloat {
    let font = UIFont.systemFont(ofSize: size)
    return font.capHeight
}
