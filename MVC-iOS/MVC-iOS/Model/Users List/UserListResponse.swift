//
//  UserListResponse.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

// MARK: - UserListResponse
struct UserListResponse: Decodable {
    let status: String
    let data: [UserDetail]
    let message: String
}

// MARK: - Datum
struct UserDetail: Decodable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
