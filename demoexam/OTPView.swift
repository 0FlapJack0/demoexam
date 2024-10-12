//
//  OTPView.swift
//  demoexam
//  Окно ввода ОТП кода
//  Created by user on 11.10.2024.
//

/*
 ВАЖНО!!!!!!!
 
 ПАРОЛЬ ДЛЯ ПЕРЕХОДА НА СЛЕД. ОКНО: 0 0 0 0 0 0
 
 */

import SwiftUI

struct OTPView: View {
    @State var code_1 = ""
    @State var code_2 = ""
    @State var code_3 = ""
    @State var code_4 = ""
    @State var code_5 = ""
    @State var code_6 = ""
    
    @State var wrongCode = false
    
    
    @State var toNewPassView = false
    
    @State var timeRemeaning = 59
  //  @State var timer =
    
    var body: some View {
            VStack{
                NavigationLink("", destination: NewPassView(), isActive: $toNewPassView)
                //Шапка
                VStack(alignment: .leading){
                    Text("OTP Verification")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundColor(.black)
                        .padding(.bottom, 3)
                        
                    Text("Enter the 6 digit numbers sent to your email")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(Color.grayMain)
                }
                .frame(width: 332, alignment: .leading)
                .padding(.bottom, 30)
                //Контент
                HStack{
                    CustomOTPField(code: $code_1, wrongCode: $wrongCode)
                    CustomOTPField(code: $code_2, wrongCode: $wrongCode)
                    CustomOTPField(code: $code_3, wrongCode: $wrongCode)
                    CustomOTPField(code: $code_4, wrongCode: $wrongCode)
                    CustomOTPField(code: $code_5, wrongCode: $wrongCode)
                    CustomOTPField(code: $code_6, wrongCode: $wrongCode)
                }
                .padding(.bottom, 30)
                //Таймер и ресендер
                VStack{
                    Text("If you didn't receive code, resend after 0:59")
                        .foregroundColor(Color.grayMain)
                        .font(.custom("Roboto-Regular", size: 14))
                }
                .padding(.bottom, 60)
                VStack{
                    Button("Set New Password"){
                        print("\(code_1)\(code_2)\(code_3)\(code_4)\(code_5)\(code_6)")
                        if "\(code_1)\(code_2)\(code_3)\(code_4)\(code_5)\(code_6)" == "000000"{
                            self.toNewPassView = true
                        } else{
                            self.wrongCode = true
                        }
                    }
                    .padding()
                    .frame(width: 330)
                    .background(Color.buttonOK)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Medium", size: 16))
                    
                    
                }
            }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OTPView()
}
