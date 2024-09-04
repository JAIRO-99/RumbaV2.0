//
//  UserModel.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation

struct UserModel: Codable {
    var name: String
    var lastName: String
    var phone: String
    var email: String
    var password: String

    static let exampleUser = UserModel(name: "Jairo", lastName: "Laurente Celis", phone: "932910224", email: "jairo@gmail.com", password: "123456789")
}
