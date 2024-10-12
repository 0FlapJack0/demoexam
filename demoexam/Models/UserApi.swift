//
//  UserApi.swift
//  demoexam
//
//  Created by user on 11.10.2024.
//

import Foundation
import Supabase

class UserApi {
              // паттерн instance
    static let instance = UserApi()

    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://yyuofinkkahwnmbyhwrp.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl5dW9maW5ra2Fod25tYnlod3JwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0Mzg2MzEsImV4cCI6MjA0NDAxNDYzMX0.hQdm4cfw4vS0PrNnyfkG-9IE0RLvvRbklJ8x_Jxj8iU",
        options: .init())
    
    func signUp(name: String, phone: String, email: String, password: String) async throws {
           try await supabase.auth.signUp(email: email, password: password)
           
           let user = try await supabase.auth.session.user
           
           let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
           
           try await supabase.from("users")
               .insert(newUser)
               .execute()
           
           try await supabase.auth.signOut()
       }
    func signIn(email: String, password: String) async throws {
        try await supabase.auth.signIn(email: email, password: password)
    }
    
    func logOut() async throws {
        try await supabase.auth.signOut()
    }
}
