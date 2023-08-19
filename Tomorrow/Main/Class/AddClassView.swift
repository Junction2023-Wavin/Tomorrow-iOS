//
//  AddClassView.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import SwiftUI

struct AddClassView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.topBarWhite)
                    .frame(height: 106)
                    .shadow(color: .shadowGray, radius: 2, x: 0, y: 1)
                
                HStack {
                    Spacer()
                    Text("Add Class")
                        .font(.pretendard(type: .semibold, size: 18))
                        .foregroundColor(.tomorrowBlueHigh)
                    Spacer()
                }
                .padding(.bottom, 18)
            }
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Class name")
                            .font(.pretendard(type: .semibold, size: 18))
                            .foregroundColor(.tomorrowBlueHigh)
                            .padding(.bottom, 12)
                        
                        TextField("ex. Happy healthy class", text: $name)
                            .textInputAutocapitalization(.never)
                            .font(.pretendard(type: .regular, size: 12))
                            .frame(height: 44)
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                            }
                            .padding(.horizontal, 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.38)
                                    .stroke(Color(red: 0.55, green: 0.55, blue: 0.55), lineWidth: 0.75)
                            )
                    }
                    .padding(.bottom, 34)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Enter a description")
                            .font(.pretendard(type: .semibold, size: 18))
                            .foregroundColor(.tomorrowBlueHigh)
                            .padding(.bottom, 12)
                        
                        TextField("ex. Let’s enjoy Happy healthy class", text: $name)
                            .textInputAutocapitalization(.never)
                            .font(.pretendard(type: .regular, size: 12))
                            .frame(height: 44)
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                            }
                            .padding(.horizontal, 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.38)
                                    .stroke(Color(red: 0.55, green: 0.55, blue: 0.55), lineWidth: 0.75)
                            )
                    }
                    .padding(.bottom, 34)
                    
                    Text("Add the lecture")
                        .font(.pretendard(type: .semibold, size: 18))
                        .foregroundColor(.tomorrowBlueHigh)
                        .padding(.bottom, 12)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 272)
                        .foregroundColor(.shadowGray)
                        .padding(.bottom, 24)
                    
                    RoundedRectangleButton(text: "Start")
                        .padding(.vertical, 20)
                }
            }
            .padding(.horizontal, 18)
            .background(Color.white)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView()
    }
}
