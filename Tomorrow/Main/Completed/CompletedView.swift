//
//  CompletedView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct CompletedView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopNavigationBar(title: "Manage last class")
                
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
                                let data = DummyData.completedProcess
                                let count = data.count
                                
                                ForEach(0 ..< count) { index in
                                    NavigationLink {
                                        ClassDetailView(title: "English study",
                                                        description: "Target: All ages",
                                                        isFavorite: true,
                                                        index: 5)
                                    } label: {
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
                        }
                        .padding(.bottom, 14)
                        
                        // Scheduled title
                        HStack {
                            Text("Completed")
                                .font(.pretendard(type: .semibold, size: 18))
                                .foregroundColor(.tomorrowBlueHigh)
                            Spacer()
                        }
                        .padding(.horizontal, 18)
                        
                        // Scheduled 리스트
                        VStack(spacing: 12) {
                            let data = DummyData.completedClass
                            let count = data.count
                            
                            ForEach(0 ..< count) { index in
                                NavigationLink {
                                    ClassDetailView(title: data[index].title,
                                                    description: data[index].description,
                                                    isFavorite: data[index].isFavorite,
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

struct TopNavigationBar: View {
    let title: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 106)
                .shadow(color: .shadowGray, radius: 2, x: 0, y: 1)
            
            HStack {
                Spacer()
                Text(title)
                    .font(.pretendard(type: .semibold, size: 18))
                    .foregroundColor(.tomorrowBlueHigh)
                Spacer()
            }
            .padding(.bottom, 18)
        }
        .padding(.bottom, 1)
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
    }
}
