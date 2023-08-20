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
    
    @State var isModalPresented: Bool = false
    
    var data: [Lecture] {
        if index == 0 {
            return DummyData.firstLectures
        } else if index == 5 {
            return DummyData.englishLectures
        } else {
            return DummyData.secondLectures
        }
    }
    
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
                            
                            Button {
                                isFavorite.toggle()
                                if isFavorite {
                                    isModalPresented = true
                                }
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
                            let count = data.count
                            
                            ForEach(0 ..< count) { i in
                                NavigationLink {
                                    LectureDetailView(index: (index == 5 ? 5 : (i == 0 ? 0 : 2)),
                                                      title: data[i].title,
                                                      description: data[i].description)
                                } label: {
                                    LectureList(image: data[i].image,
                                                title: data[i].title,
                                                description: data[i].description)
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
            
            if isModalPresented {
                RegisterModal(isModalPresented: $isModalPresented)
            }

        }
    }
}

struct RegisterModal: View {
    @Binding var isModalPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                               .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Would you like to register\nfor the schedule?")
                    .font(.pretendard(type: .regular, size: 21))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.16))
                    .padding(.bottom, 24)
                HStack {
                    Button {
                        self.isModalPresented = false
                    } label: {
                        Text("YES").font(.pretendard(type: .medium, size: 16)).foregroundColor(.white).frame(width: 126, height: 36).background(Color.tomorrowBlue).cornerRadius(10)
                    }
                    Button {
                        self.isModalPresented = false
                    } label: {
                        Text("No").font(.pretendard(type: .medium, size: 16)).foregroundColor(.white).frame(width: 126, height: 36).background(Color.tomorrowBlue).cornerRadius(10)
                    }
                }
            }.frame(maxHeight: 180).padding(.horizontal, 28)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(.white)
                )
        }
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
