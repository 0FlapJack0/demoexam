//
//  ContentView.swift
//  demoexam
//  Окно регистрации
//  Created by user on 11.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var check = false
    
    @State var toLoginView = false
    @State var toLoginViewX = false
    
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink("", destination: LogInView(), isActive: $userViewModel.isNavigate)
                NavigationLink("", destination: LogInView(), isActive: $toLoginViewX)
                //Шапка
                VStack(alignment: .leading){
                    Text("Create an account")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundColor(.black)
                        .padding(.bottom, 3)
                        
                    Text("Complete the sign up process to get started")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(Color.grayMain)
                }
                .frame(width: 332, alignment: .leading)
                .padding(.bottom, 20)
                .alert(isPresented: $userViewModel.error){
                    Alert(title: Text("Error"),
                          message: Text(userViewModel.errorText),
                          dismissButton: .default(Text("OK")))
                }
                //Контент
                VStack(alignment: .leading){
                    CustomTextField(label: "Full name", placeholder: "Ivanov Ivan", isSecureField: false, text: $userViewModel.user.name)
                    CustomTextField(label: "Phone Number", placeholder: "+7(999)999-99-99", isSecureField: false, text: $userViewModel.user.phone)
                    CustomTextField(label: "Email Address", placeholder: "************@mail.com", isSecureField: false, text: $userViewModel.email)
                    CustomTextField(label: "Password", placeholder: "********", isSecureField: true, text: $userViewModel.password)
                    CustomTextField(label: "Confirm Password", placeholder: "********", isSecureField: true, text: $userViewModel.confirmPassword)
                }
                .padding(.bottom, 10)
                HStack{
                    CustomCheckBox(value: $check)
                    VStack{
                        Text("By ticking this box, you agree to our")
                            .foregroundColor(Color.grayMain)
                            .font(.custom("Roboto-Regular", size: 12))
                        Text("Terms and conditions and private policy")
                            .foregroundColor(Color.yellow)
                            .font(.custom("Roboto-Regular", size: 12))
                    }
                    .frame(width: 310)
                    
                }
                .frame(width: 332)
                //Подвал
                Spacer()
                VStack{
                    if userViewModel.user.name != "" && userViewModel.user.phone != "" && userViewModel.email != "" && userViewModel.password != "" && userViewModel.confirmPassword != "" && check{
                        Button("Sign Up"){
                            userViewModel.signUp()
                        }
                        .padding()
                        .frame(width: 330)
                        .background(Color.buttonOK)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                        .font(.custom("Roboto-Medium", size: 16))
                    } else {
                        Button("Sign Up"){
                        }
                        .padding()
                        .frame(width: 330)
                        .background(Color.grayMain)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                        .font(.custom("Roboto-Medium", size: 16))
                    }
                    
                    HStack{
                        Text("Already have an account?")
                            .foregroundColor(Color.grayMain)
                            .font(.custom("Roboto-Regular", size: 14))
                        Button("Sign in"){
                            self.toLoginViewX = true
                        }
                        .foregroundColor(Color.buttonOK)
                        .font(.custom("Roboto-Medium", size: 14))
                        
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    Text("Or sign in using")
                        .foregroundColor(Color.grayMain)
                        .font(.custom("Roboto-Regular", size: 14))
                        .padding(.bottom, 3)
                    Image(systemName: "house")
                }
                .alert(isPresented: $userViewModel.error){
                    Alert(title: Text("Error"),
                          message: Text(userViewModel.errorText),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
