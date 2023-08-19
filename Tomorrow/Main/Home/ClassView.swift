//
//  ClassView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct ClassView: View {
    var isFavorite: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 108)
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
                            Text("A letter-finding program")
                                .font(.pretendard(type: .semibold, size: 18))
                                .foregroundColor(.tomorrowBlueHigh)
                            
                            Text("Target: Preschoolers")
                                .font(.pretendard(type: .extraLight, size: 12))
                                .foregroundColor(.tomorrowGray)
                        }
                        
                        Spacer()
                        
                        // TODO: 북마크 기능 추가
                        Button {
                            
                        } label: {
                            Image(systemName: isFavorite ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.tomorrowBlueHigh)
                        }
                    }
                    .padding(.top, 28)
                    .padding(.horizontal, 18)
                    
                    // lecture list
                    VStack(spacing: 12) {
                        ForEach(1 ..< 12) { index in
                            LectureList(title: "\(index). Let's find 'GA'!",
                                          description: "Find a letter of 'GA' to learn 'GA'")
                            .padding(.horizontal, 18)
                        }
                    }
                    .padding(.vertical, 20)
                }
            }
            .background(
                Color.backgroundWhite
            )
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct LectureList: View {
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
                // TODO: 이미지 url
                Image("processDefault")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .scaledToFill()
                    .clipShape(Circle())
                    .padding(.leading, 16)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.pretendard(type: .medium, size: 17))
                        .foregroundColor(.tomorrowGray)
                    Text(description)
                        .font(.pretendard(type: .extraLight, size: 12))
                        .foregroundColor(.tomorrowGray)
                }
                .padding(.leading, 12)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .frame(width: 13, height: 22)
                    .padding(.trailing, 28)
            }
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
