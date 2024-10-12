//
//  UserModel.swift
//  demoexam
//
//  Created by user on 11.10.2024.
//

import Foundation

struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}
