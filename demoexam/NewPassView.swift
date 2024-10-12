//
//  NewPassView.swift
//  demoexam
//  Окно восстановления пароля
//  Created by user on 11.10.2024.
//

import SwiftUI

struct NewPassView: View {
    @State var pass = ""
    @State var passConfirm = ""
    
    @State var toLoginView = false
    
    var body: some View {
            VStack{
                NavigationLink("", destination: LogInView(), isActive: $toLoginView)
                //Шапка
                Spacer()
                VStack(alignment: .leading){
                    Text("New Password")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundColor(.black)
                        .padding(.bottom, 3)
                        
                    Text("Enter new password")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(Color.grayMain)
                }
                .frame(width: 332, alignment: .leading)
                .padding(.bottom, 50)
                //Контент
                VStack(alignment: .leading){
                    CustomTextField(label: "Password", placeholder: "********", isSecureField: true, text: $pass)
                    CustomTextField(label: "Confirm Password", placeholder: "********", isSecureField: true, text: $passConfirm)
                }
                .padding(.bottom, 50)
                VStack{
                    Button("Log in"){
                        self.toLoginView = true
                    }
                    .padding()
                    .frame(width: 330)
                    .background(Color.buttonOK)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Medium", size: 16))
                    
                }
                Spacer()
            }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NewPassView()
}
