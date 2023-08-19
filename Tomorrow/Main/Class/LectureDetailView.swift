//
//  LectureDetailView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct LectureDetailView: View {
    var index: Int = 2
    var title: String = "1. Let's find 'GA'!"
    var description: String = "Find a letter of 'GA' to learn 'GA'"
    
    @State private var isStarted: Bool = true
    @State private var imageIndex: Int = 1
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TopNavigationBar(title: "Class")
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // title
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(title)
                                    .font(.pretendard(type: .semibold, size: 18))
                                    .foregroundColor(.tomorrowBlueHigh)
                                
                                Text(description)
                                    .font(.pretendard(type: .extraLight, size: 12))
                                    .foregroundColor(.tomorrowGray)
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 28)
                        .padding(.horizontal, 18)
                        
                        // lecture list
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible())], spacing: 20) {
                            if index == 0 {
                                ForEach(1 ..< 6, id: \.self) { item in
                                    Image("lecture1_\(item)")
                                        .resizable()
                                        .frame(height: 300)
                                }
                            } else {
                                ForEach(1 ..< 7, id: \.self) { item in
                                    Image("lecture2_\(item)")
                                        .resizable()
                                        .frame(height: 300)
                                }
                            }
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 18)
                        .padding(.bottom, 20)
                        
                        Button {
                            APIManager.shared.goNextPost(index: 1)
                        } label: {
                            RoundedRectangleButton(text: "Start")
                                .padding(.vertical, 20)
                                .padding(.horizontal, 18)
                        }
                    }
                }
                .background(
                    Color.white
                )
            }
            .edgesIgnoringSafeArea(.top)
            
            if isStarted {
                popUpView
            }
        }
        .navigationBarBackButtonHidden(isStarted)
    }
    
    var popUpView: some View {
        ZStack {
            Color.black.opacity(0.85)
                .ignoresSafeArea()
            
            ZStack(alignment: .topTrailing) {
                Image("lecture\(index == 0 ? 1 : 2)_\(imageIndex)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 520)
                
                Button {
                    isStarted = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                        .padding(16)
                }
            }
            
            HStack(alignment: .center) {
                if imageIndex != 1 {
                    Button {
                        imageIndex -= 1
                    } label: {
                        Image("leftButton")
                    }
                }
                
                Spacer()
                
                if imageIndex != (index == 0 ? 5 : 6) {
                    Button {
                        imageIndex += 1
                    } label: {
                        Image("rightButton")
                    }
                }
            }
        }
    }
}

struct LectureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
