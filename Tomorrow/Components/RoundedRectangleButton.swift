//
//  RoundedRectangleButton.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct RoundedRectangleButton: View {
    let text: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.pretendard(type: .medium, size: 16))
                .foregroundColor(.white)
            Spacer()
        }
        .background {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 56)
                .background(Color.tomorrowBlue)
                .cornerRadius(8)
        }
    }
}
