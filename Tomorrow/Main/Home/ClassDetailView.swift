//
//  ClassView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct ClassDetailView: View {
    @State private var isFavorite: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            TopNavigationBar(title: "Class")
            
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
                        
                        Button {
                            isFavorite.toggle()
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
                            NavigationLink {
                                LectureDetailView()
                            } label: {
                                LectureList(title: "\(index). Let's find 'GA'!",
                                              description: "Find a letter of 'GA' to learn 'GA'")
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

struct ClassDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClassDetailView()
    }
}
