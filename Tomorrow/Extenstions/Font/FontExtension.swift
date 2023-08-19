//
//  FontExtension.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import Foundation
import SwiftUI

extension Font {
    enum TomorrowFont {
        case extraLight
        case medium
        case regular
        case semibold
        
        var weight: String {
            switch self {
            case .extraLight:
                return "Pretendard-ExtraLight"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .semibold:
                return "Pretendard-SemiBold"
            }
        }
    }

    static func pretendard(type: TomorrowFont, size: CGFloat) -> Font {
        return .custom(type.weight, size: size)
    }
}
