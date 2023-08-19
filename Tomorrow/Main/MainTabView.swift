//
//  MainTabView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CompletedView()
                .tabItem {
                    Image(selectedTab == 0 ? "tabbedCompleted" : "unTabbedCompleted")
                    Text("COMPLETED")
                        .font(.pretendard(type: .regular, size: 12))
                        .foregroundColor(.tomorrowBlue)
                }
                .tag(0)
            
            HomeView()
                .tabItem {
                    Image(selectedTab == 1 ? "tabbedHome" : "unTabbedHome")
                    Text("HOME")
                        .font(.pretendard(type: .regular, size: 12))
                        .foregroundColor(.tomorrowBlue)
                }
                .tag(1)
            
            ClassView()
                .tabItem {
                    Image(selectedTab == 2 ? "tabbedClass" : "unTabbedClass")
                    Text("PROGRAM")
                        .font(.pretendard(type: .regular, size: 12))
                        .foregroundColor(.tomorrowBlue)
                }
                .tag(2)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
