//
//  ClassView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct ClassDetailView: View {
    var title: String = "A letter-finding program"
    var description: String = "Target: Preschoolers"
    
    @State var isFavorite: Bool = false
    var index: Int = 0
    
    var body: some View {
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
                        let data = index == 0 ? DummyData.firstLectures : DummyData.secondLectures
                        let count = data.count
                        
                        ForEach(0 ..< count) { index in
                            NavigationLink {
                                LectureDetailView(index: index == 0 ? 0 : 2,
                                                  title: data[index].title,
                                                  description: data[index].description)
                            } label: {
                                LectureList(image: data[index].image,
                                            title: data[index].title,
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

struct LectureList: View {
    let image: String
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
                Image(image)
                    .resizable()
                    .frame(width: 56, height: 56)
                    .scaledToFill()
                    .clipShape(Circle())
                    .padding(.leading, 16)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.pretendard(type: .medium, size: 17))
                        .foregroundColor(.tomorrowGray)
                        .lineLimit(1)
                    Text(description)
                        .font(.pretendard(type: .extraLight, size: 12))
                        .foregroundColor(.tomorrowGray)
                        .lineLimit(1)
                    HStack { Spacer() }
                }
//                .frame(width: 220)
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
