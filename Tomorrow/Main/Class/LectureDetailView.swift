//
//  LectureDetailView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct LectureDetailView: View {
    let items = (0 ..< 7).map { "Item \($0)" }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.topBarWhite)
                    .frame(height: 106)
                    .shadow(color: .shadowGray, radius: 2, x: 0, y: 1)
                
                HStack {
                    Spacer()
                    Text("Class")
                        .font(.pretendard(type: .semibold, size: 18))
                        .foregroundColor(.tomorrowBlueHigh)
                    Spacer()
                }
                .padding(.bottom, 18)
            }
            
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
                        ForEach(items, id: \.self) { item in
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(height: 300)
                                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                Text(item)
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 18)
                    .padding(.bottom, 20)
                    
                    RoundedRectangleButton(text: "Start")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 18)
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
