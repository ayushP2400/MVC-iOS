//
//  CreateUserResponse.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

struct CreateUserResponse: Decodable {
    let status: String
    let data: createUserData
}

struct createUserData: Decodable {
    let name, salary, age: String
    let id: Int
}
