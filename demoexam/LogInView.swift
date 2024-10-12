//
//  LogInView.swift
//  demoexam
//  Окно авторизации
//  Created by user on 11.10.2024.
//

import SwiftUI



struct LogInView: View {
    @State var email = ""
    @State var pass = ""
    
    @State var check = false
    
    @State var toForgotView = false
    @State var toRegisterView = false
    @State var toHomeView = false
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink("", destination: ContentView(), isActive: $toRegisterView)
                NavigationLink("", destination: ForgotPassView(), isActive: $toForgotView)
                NavigationLink("", destination: HomeView(), isActive: $userViewModel.isNavigate)
                //Шапка
                Spacer()
                VStack(alignment: .leading){
                    Text("Welcome Back")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundColor(.black)
                        .padding(.bottom, 3)
                        
                    Text("Fill in your email and password to continue")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(Color.grayMain)
                }
                .frame(width: 332, alignment: .leading)
                .padding(.bottom, 20)
                //Контент
                VStack(alignment: .leading){
                    CustomTextField(label: "Email Address", placeholder: "************@mail.com", isSecureField: false, text: $userViewModel.email)
                    CustomTextField(label: "Password", placeholder: "********", isSecureField: true, text: $userViewModel.password)
                }
                HStack{
                    CustomCheckBox(value: $check)
                    Text("Remember Password")
                        .foregroundColor(Color.grayMain)
                        .font(.custom("Roboto-Medium", size: 12))
                    Spacer()
                    Button("Forgot Password?"){
                        self.toForgotView = true
                    }
                        .foregroundColor(Color.buttonOK)
                        .font(.custom("Roboto-Medium", size: 12))
                }
                .frame(width: 332)
                //Подвал
                Spacer()
                VStack{
                    if userViewModel.email != "" && userViewModel.password != "" {
                        Button("Log In"){
                            userViewModel.signIn()
                        }
                        .padding()
                        .frame(width: 330)
                        .background(Color.buttonOK)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                        .font(.custom("Roboto-Medium", size: 16))
                    } else {
                        Button("Log In"){
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
                        Button("Sign Up"){
                            self.toRegisterView = true
                        }
                        .foregroundColor(Color.buttonOK)
                        .font(.custom("Roboto-Medium", size: 14))
                        
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    Text("Or log in using")
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LogInView()
}
