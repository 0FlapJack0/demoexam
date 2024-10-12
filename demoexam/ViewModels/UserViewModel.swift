//
//  UserViewModel.swift
//  demoexam
//
//  Created by user on 11.10.2024.
//

import Foundation


class UserViewModel: ObservableObject{
    
    @Published var user = UserModel(id: UUID(), name: "", phone: "", created_at: .now)

    @Published  var email: String = ""
    @Published  var password: String = ""
    @Published  var confirmPassword: String = ""
    
    @Published  var isProgress: Bool = false
    @Published var isNavigate: Bool = false
    @Published  var error: Bool = false
    @Published  var errorText: String = "???"
    
    func signUp() {
                    Task {
                        do {
                            await MainActor.run {
                                self.isProgress = true
                            }
                            try await UserApi.instance.signUp(name: user.name, phone: user.phone, email: email, password: password)
                            await MainActor.run {
                                self.isNavigate = true
                                self.isProgress = false
                            }
                        } catch {
                            self.errorText = error.localizedDescription
                            print("ERROR: " + errorText)
                            await MainActor.run {
                                self.error = true
                                self.isProgress = false
                            }
                        }
                    }
                }
    

    func signIn() {
                    Task {
                        do {
                            await MainActor.run {
                                self.isProgress = true
                            }
                            try await UserApi.instance.signIn(email: email, password: password)
                            await MainActor.run {
                                self.isNavigate = true
                                self.isProgress = false
                            }
                        } catch {
                            self.errorText = error.localizedDescription
                            print("ERROR: " + errorText)
                            await MainActor.run {
                                self.error = true
                                self.isProgress = false
                            }
                        }
                    }
                }
}
