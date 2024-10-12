//
//  ForgotPassView.swift
//  demoexam
//  Окно восстановления пароля
//  Created by user on 11.10.2024.
//

import SwiftUI

struct ForgotPassView: View {
    @State var email = ""
    
    @State var toOTPView = false
    @State var toLoginView = false
    
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink("", destination: OTPView(), isActive: $toOTPView)
                NavigationLink("", destination: LogInView(), isActive: $toLoginView)
                //Шапка
                Spacer()
                VStack(alignment: .leading){
                    Text("Forgot Password")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundColor(.black)
                        .padding(.bottom, 3)
                        
                    Text("Enter your email address")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(Color.grayMain)
                }
                .frame(width: 332, alignment: .leading)
                .padding(.bottom, 50)
                //Контент
                VStack(alignment: .leading){
                    CustomTextField(label: "Email Address", placeholder: "************@mail.com", isSecureField: false, text: $email)
                }
                VStack{
                    //GALOCHKA!!!!!!!!!!
                }
                //Подвал
                Spacer()
                VStack{
                    Button("Send OTP"){
                        self.toOTPView = true
                    }
                    .padding()
                    .frame(width: 330)
                    .background(Color.buttonOK)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Medium", size: 16))
                    
                    HStack{
                        Text("Remember password? Back to")
                            .foregroundColor(Color.grayMain)
                            .font(.custom("Roboto-Regular", size: 14))
                        Button("Sign in"){
                            self.toLoginView = true
                        }
                        .foregroundColor(Color.buttonOK)
                        .font(.custom("Roboto-Medium", size: 14))
                        
                    }
                    .padding(.top, 10)
                }
               Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ForgotPassView()
}
