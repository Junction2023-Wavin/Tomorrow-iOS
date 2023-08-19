//
//  HomeView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                        ProcessCard(title: "A dementia prevention project",
                                    presentProgress: 6, totalProgress: 24)
                            .padding(.leading, 18)

                        ForEach(1 ..< 4) { _ in
                            ProcessCard(title: "A dementia prevention project",
                                        presentProgress: 13, totalProgress: 19)
                        }

                        ProcessCard(title: "A dementia prevention project",
                                    presentProgress: 6, totalProgress: 24)
                            .padding(.trailing, 18)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 34)

                // Scheduled title
                HStack {
                    Text("Scheduled")
                        .font(.pretendard(type: .semibold, size: 18))
                        .foregroundColor(.tomorrowBlueHigh)
                    Spacer()
                }
                .padding(.horizontal, 18)
                
                VStack(spacing: 12) {
                    ForEach(1 ..< 6) { _ in
                        ScheduledList(title: "A letter-finding program",
                                      description: "Target: Preschoolers")
                            .padding(.horizontal, 18)
                    }
                }
                .padding(.top, 20)
            }
        }
        .background(
            Color.backgroundWhite
        )
    }
}

struct ScheduledList:View {
    let title: String
    let description: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 90)
                .cornerRadius(20)
                .shadow(color: Color.shadowGray, radius: 5, x: 0, y: 0)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.pretendard(type: .medium, size: 17))
                        .foregroundColor(.tomorrowGray)
                    Text(description)
                        .font(.pretendard(type: .extraLight, size: 12))
                        .foregroundColor(.tomorrowGray)
                }
                .padding(.leading, 32)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .frame(width: 13, height: 22)
                    .padding(.trailing, 28)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
