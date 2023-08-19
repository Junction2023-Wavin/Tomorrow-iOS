//
//  LectureDetailView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct LectureDetailView: View {
    var body: some View {
        VStack(spacing: 0) {
            TopNavigationBar(title: "Class")
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // title
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("1. Let's find 'GA'!")
                                .font(.pretendard(type: .semibold, size: 18))
                                .foregroundColor(.tomorrowBlueHigh)
                            
                            Text("Find a letter of 'GA' to learn 'GA'")
                                .font(.pretendard(type: .extraLight, size: 12))
                                .foregroundColor(.tomorrowGray)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 28)
                    .padding(.horizontal, 18)
                    
                    // lecture list
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible())], spacing: 20) {
                        ForEach(1 ..< 7, id: \.self) { item in
                            Image("lecture2_\(item)")
                                .resizable()
                                .frame(height: 300)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 18)
                    .padding(.bottom, 20)
                    
                    Button {
                        APIManager.shared.goNextPost(index: 2)
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
    }
}

struct LectureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LectureDetailView()
    }
}
