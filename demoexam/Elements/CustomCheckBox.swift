//
//  CustomCheckBox.swift
//  demoexam
//
//  Created by user on 11.10.2024.
//

import SwiftUI

struct CustomCheckBox: View {
   @Binding var value: Bool
    var body: some View {
        Group{
            if value{
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 16, height: 16)
                    .overlay{
                        if value {
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor, lineWidth: 1)
                    .frame(width: 16, height: 16)
            }
        }
        .onTapGesture {
            self.value.toggle()
        }
    }
}
