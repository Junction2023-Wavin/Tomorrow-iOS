//
//  HomeView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopNavigationBar(title: "Today's class")
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // Process 타이틀
                        HStack {
                            Text("Process")
                                .font(.pretendard(type: .semibold, size: 18))
                                .foregroundColor(.tomorrowBlueHigh)
                            Spacer()
                        }
                        .padding(.top, 28)
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
                        
                        // Scheduled 리스트
                        VStack(spacing: 12) {
                            ForEach(1 ..< 6) { _ in
                                NavigationLink {
                                    ClassDetailView()
                                } label: {
                                    ClassList(title: "A letter-finding program",
                                                  description: "Target: Preschoolers")
                                }
                            }
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 20)
                    }
                }
                .background(
                    Color.backgroundWhite
                )
            }
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
