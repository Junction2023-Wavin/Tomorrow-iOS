//
//  ProcessCard.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct ProcessCard: View {
    let title: String
    let image: String
    
    let presentProgress: Int
    let totalProgress: Int
    var rate: Double {
        return Double(presentProgress) / Double(totalProgress)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .overlay(Text("0"))
                .cornerRadius(10)
                .shadow(color: Color.shadowGray, radius: 5, x: 0, y: 0)
            
            VStack(spacing: 0) {
                ZStack {
                    Image(image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    // progress circle
                    Circle()
                        .trim(from: 0, to: rate)
                        .stroke(
                            Color.tomorrowBlue,
                            style: StrokeStyle(lineWidth: 8, lineCap: .round)
                        )
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeOut(duration: 1.0), value: rate)
                }
                .padding(.top, 28)
                
                Text(title)
                    .frame(maxWidth: 160)
                    .frame(height: 32)
                    .font(.pretendard(type: .semibold, size: 12))
                    .foregroundColor(.tomorrowGray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                Text("\(presentProgress)/\(totalProgress)")
                    .font(.pretendard(type: .regular, size: 8))
                    .foregroundColor(.tomorrowGray)
                    .padding(.top, 4)
            }
        }
    }
}
