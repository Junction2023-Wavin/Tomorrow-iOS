//
//  HomeView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        
        ScrollView {
            VStack(spacing: 0) {
                // Process 타이틀
                HStack {
                    Text("Process")
                        .font(.pretendard(type: .semibold, size: 18))
                        .foregroundColor(.tomorrowBlueHigh)
                    Spacer()
                }
                .padding(.horizontal, 18)
                
                // 진행중인 과정 카드 scrollview
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 200)
                            .overlay(Text("0"))
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0.51, green: 0.51, blue: 1).opacity(0.15), radius: 5, x: 0, y: 0)
                            .padding(.leading, 18)
                        
                        ForEach(1 ..< 10) { index in
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(width: 200, height: 200)
                                .overlay(Text("\(index)"))
                                .cornerRadius(10)
                                .shadow(color: Color(red: 0.51, green: 0.51, blue: 1).opacity(0.15), radius: 5, x: 0, y: 0)

                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 34)
                }
                
                // Scheduled title
                HStack {
                    Text("Scheduled")
                        .font(.pretendard(type: .semibold, size: 18))
                        .foregroundColor(.tomorrowBlueHigh)
                    Spacer()
                }
                .padding(.horizontal, 18)
            }
        }
        .background(
            Color(red: 0.98, green: 0.98, blue: 0.98)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
