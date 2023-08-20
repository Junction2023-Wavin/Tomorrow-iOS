//
//  MyPage.swift
//  Tomorrow
//
//  Created by 이재원 on 2023/08/20.
//

import SwiftUI

struct MyPage: View {
    var body: some View {
        VStack {
            TopNavigationBar(title: "My Page")
            VStack {
                HStack {
                    Text("Hi,")
                        .font(.pretendard(type: .medium, size: 22))
                        .foregroundColor(.tomorrowGray)
                        .padding(.top, 40)
                    Spacer()
                }
                HStack {
                    Text("Junction 2023 Asia")
                        .font(.pretendard(type: .medium, size: 31))
                        .foregroundColor(.tomorrowBlueHigh)
                        .padding(.top, 3)
                    Spacer()
                }
                HStack {
                    Text("Haeundae Social Welfare Center")
                        .font(.pretendard(type: .regular, size: 18))
                        .foregroundColor(.tomorrowGray)
                    Spacer()
                }.padding(.bottom, 13)
                HStack {
                    Image(systemName: "location.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.tomorrowGray)
                    Text("506, Jwa-dong Circulation Road, \nHaeundae-gu, Busan")
                        .font(.pretendard(type: .regular, size: 14))
                        .foregroundColor(.tomorrowGray)
                    Spacer()
                }
                
                Divider().frame(height: 1.5).foregroundColor(.tomorrowGray)
                    .padding(.vertical, 20)
                
                HStack {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.tomorrowGray)
                    Text("Setting")
                        .font(.pretendard(type: .medium, size: 16))
                        .foregroundColor(.tomorrowGray)
                    Spacer()
                }
                
                Divider().frame(height: 1.5).foregroundColor(.tomorrowGray)
                    .padding(.vertical, 20)
                
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.system(size: 18))
                        .foregroundColor(.tomorrowGray)
                    Text("Logout")
                        .font(.pretendard(type: .medium, size: 16))
                        .foregroundColor(.tomorrowGray)
                    Spacer()
                }
            }.padding(.horizontal, 38)
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}
