//
//  UserModel.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation

struct UserModel: Codable {
    /*
    var name: String
    var lastName: String
    var phone: String
    var email: String
    var password: String

    static let exampleUser = UserModel(name: "Jairo", lastName: "Laurente Celis", phone: "932910224", email: "jairo@gmail.com", password: "123456789")
    */
    
    var username: String
    var password: String
    var firstname: String
    var lastname: String
    var email: String

    
 
     }

/*
    "userFirstName": "ana",
    "userLastName": "juanez",
    "userEmail": "ana.juanez@example.com",
    "userPassword": "password456",
    "userPhone": "987654321",
    "imageData": "base64ImageDataHere",
    "role": "USER",
    "couponCode": "FREE10DAYS"

*/
