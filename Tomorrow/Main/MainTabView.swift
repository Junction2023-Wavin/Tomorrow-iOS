//
//  MainTabView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("First Tab Content")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("CLASS")
                        .font(.pretendard(type: .regular, size: 12))
                        .foregroundColor(.tomorrowBlue)
                }
            
            HomeView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("HOME")
                        .font(.pretendard(type: .regular, size: 12))
                        .foregroundColor(.tomorrowBlue)
                }
            
            Text("Third Tab Content")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("PROGRAM")
                        .font(.pretendard(type: .regular, size: 12))
                        .foregroundColor(.tomorrowBlue)
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
