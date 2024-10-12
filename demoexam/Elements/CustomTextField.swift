//
//  CustomTextField.swift
//  demoexam
//  Текстовое поле
//  Created by user on 11.10.2024.
//

import SwiftUI

struct CustomTextField: View{
    let label: String
    let placeholder: String
    let isSecureField: Bool
    @State var isShowpass = false
    @Binding var text: String
    var body: some View{
        VStack(alignment: .leading){
            Text(label)
                .foregroundColor(Color.grayMain)
                .font(.custom("Roboto-Medium", size: 14))
                .padding(.leading, 30)
        }
        VStack(alignment: .leading){
            
            ZStack{
                if isSecureField {
                    if !isShowpass {
                        SecureField(placeholder, text: $text)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5)
                            .padding(1)
                            .background(
                                text == "" ? Color.grayMain : Color.blue
                            )
                            .cornerRadius(5)
                            .foregroundColor(.black)
                            .font(.custom("Roboto-Regular", size: 14))
                    } else {
                        TextField(placeholder, text: $text)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5)
                            .padding(1)
                            .background(
                                text == "" ? Color.grayMain : Color.blue
                            )
                            .cornerRadius(5)
                            .foregroundColor(.black)
                            .font(.custom("Roboto-Regular", size: 14))
                    }
                } else {
                    TextField(placeholder, text: $text)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding(1)
                        .background(
                            text == "" ? Color.grayMain : Color.blue
                        )
                        .cornerRadius(5)
                        .foregroundColor(.black)
                        .font(.custom("Roboto-Regular", size: 14))
                }
                
                HStack{
                    if text == ""{
                        Text(placeholder)
                            .padding()
                            .foregroundColor(Color.graySecond)
                            .font(.custom("Roboto-Regular", size: 14))
                    }
                    Spacer()
                    if (isSecureField){
                        Image(systemName: "eye")
                            .padding()
                            .font(.system(size: 12))
                            .onTapGesture {
                                self.isShowpass.toggle()
                            }
                    }
                    
                }
            }
        }
        .padding(.bottom, 10)
        .padding(.horizontal, 30)
    }
}



