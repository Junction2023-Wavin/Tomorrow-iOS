//
//  LectureDetailView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct LectureDetailView: View {
    var index: Int
    var title: String
    var description: String
    
    var lectureImages: [String] {
        if index == 0 {
            return ["lecture1_1", "lecture1_2", "lecture1_3", "lecture1_4", "lecture1_5"]
        } else if index == 5 {
            return ["apple", "orange", "banana"]
        } else {
            return ["lecture2_1", "lecture2_2", "lecture2_3", "lecture2_4", "lecture2_5", "lecture2_6"]
        }
    }
    
    @State private var isStarted: Bool = false
    @State private var imageIndex: Int = 0
    
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
                            ForEach(lectureImages, id: \.self) { image in
                                Image(image)
                                    .resizable()
                                    .frame(height: 300)
                            }
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 18)
                        .padding(.bottom, 20)
                        
                        Button {
                            APIManager.shared.goNextPost(index: 1) { isSuccess in
                                if isSuccess {
                                    isStarted = true
                                }
                            }
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
                Image(lectureImages[imageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 520)
                
                Button {
                    isStarted = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.tomorrowBlue)
                        .padding(16)
                }
            }
            
            HStack(alignment: .center) {
                if imageIndex != 0 {
                    Button {
                        imageIndex -= 1
                        APIManager.shared.goNextPost(index: imageIndex+1) { isSuccess in
                            
                        }
                    } label: {
                        Image("leftButton")
                    }
                }
                
                Spacer()
                
                if imageIndex != (lectureImages.count - 1) {
                    Button {
                        imageIndex += 1
                        APIManager.shared.goNextPost(index: imageIndex+1) { isSuccess in
                            
                        }
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
