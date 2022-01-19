//
//  User.swift
//  SnakeJSONApp
//
//  Created by Ege Sucu on 19.01.2022.
//

import Foundation

struct Users: Codable{
    var users: [User]
}

struct User: Codable{
    var userName : String
    var userAge : Int
    var userHobbies: [String]
    var userLanguages: [String]
}
