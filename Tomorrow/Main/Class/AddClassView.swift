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
            TopNavigationBar(title: "Add class")
            
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
                    
                    
                    HStack {
                        Spacer()
                        VStack {
                            Button {
                                // TODO: 이미지선택?
                            } label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 13.14))
                                    .foregroundColor(Color.plusGray)
                                    .padding(31.43)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5.2)
                                            .foregroundColor(Color.buttonGray)
                                    )
                            }
                            Text("사진을 추가해주세요")
                                .font(.pretendard(type: .regular, size: 16))
                                .padding(.top, 11.5)
                        }
                        Spacer()
                    }.frame(minHeight: 275).background(
                        RoundedRectangle(cornerRadius: 7)
                            .inset(by: 0.38)
                            .stroke(style: StrokeStyle(lineWidth: 0.75))
                            .foregroundColor(Color.plusGray)
                    )
                        

                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 272)
                        .foregroundColor(.white)
                        
                    RoundedRectangleButton(text: "Start")
                        .padding(.vertical, 20)
                        .padding(.top, 24)
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
