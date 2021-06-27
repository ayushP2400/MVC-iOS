//
//  Constant.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

var baseUrl = "http://dummy.restapiexample.com/api/v1/"

enum Endpoint: String {
    case userList = "employees"
    case createUser = "create"
    func path() -> String {
        return baseUrl + self.rawValue
    }
}
