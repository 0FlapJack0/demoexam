//
//  HomeView.swift
//  demoexam
//  ДОМ
//  Created by user on 11.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var userViewModel = UserViewModel()
    var body: some View {
        Text("Home")
            .font(.custom("Roboto-Regular", size: 24))
        
    }
}

#Preview {
    HomeView()
}
