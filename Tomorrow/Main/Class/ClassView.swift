//
//  ClassView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct ClassView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    TopNavigationBar(title: "All classes")
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
                        // title
                        HStack {
                            Text("All Classes")
                                .font(.pretendard(type: .semibold, size: 18))
                                .foregroundColor(.tomorrowBlueHigh)
                            
                            Spacer()
                            
                            NavigationLink {
                                AddClassView()
                            } label: {
                                Text("+Add")
                                    .font(.pretendard(type: .semibold, size: 16))
                                    .foregroundColor(.tomorrowBlueHigh)
                                    .background {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 56, height: 27)
                                            .background(.white)
                                            .cornerRadius(12)
                                            .shadow(color: Color.shadowGray, radius: 2, x: 0, y: 1)
                                    }
                                    .padding(.trailing, 8)
                            }
                        }
                        .padding(.top, 28)
                        .padding(.horizontal, 18)
                        
                        // class list
                        VStack(spacing: 12) {
                            let data = DummyData.allClass
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

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
