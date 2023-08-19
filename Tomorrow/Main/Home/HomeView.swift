//
//  HomeView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct HomeView: View {
    @State var isMyPagePresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    TopNavigationBar(title: "Today's class")
                    HStack {
                        Spacer()
                        NavigationLink {
                            MyPage()
                        } label: {
                            Image(systemName: "person")
                                .font(.system(size: 23))
                                .padding(5)
                                .padding(.top, 45).padding(.trailing, 10)
                        }
                    }
                }
                
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
                                let data = DummyData.homeProcess
                                let count = data.count
                                
                                ForEach(0 ..< count) { index in
                                    ProcessCard(title: data[index].title,
                                                image: data[index].image,
                                                presentProgress: data[index].present,
                                                totalProgress: data[index].total)
                                    .padding(.leading, index == 0 ? 18 : 0)
                                    .padding(.trailing, index == (count - 1) ? 18 : 0)
                                    .padding(.vertical, 20)
                                }
                            }
                        }
                        .padding(.bottom, 14)
                        
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
                            let data = DummyData.homeClass
                            let count = data.count
                            
                            ForEach(0 ..< count) { index in
                                NavigationLink {
                                    ClassDetailView(title: data[index].title,
                                                    description: data[index].description,
                                                    isFavorite: true,
                                                    index: index)
                                } label: {
                                    ClassList(title: data[index].title,
                                              description: data[index].description)
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
