//
//  ClassView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct ClassView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 106)
                    .shadow(color: .shadowGray, radius: 2, x: 0, y: 1)
                
                HStack {
                    Spacer()
                    Text("All Classes")
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
                        Text("All Classes")
                            .font(.pretendard(type: .semibold, size: 18))
                            .foregroundColor(.tomorrowBlueHigh)
                        
                        Spacer()
                        
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
                    }
                    .padding(.top, 28)
                    .padding(.horizontal, 18)
                    
                    // lecture list
                    VStack(spacing: 12) {
                        ForEach(1 ..< 12) { index in
                            ClassList(title: "A letter-finding program",
                                          description: "Target: Preschoolers")
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

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
