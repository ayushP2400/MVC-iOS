//
//  CreateUserValidation.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

struct CreateUserValidation {
    func validate(request: CreateUserRequest) -> ValidationResult {
        if request.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return ValidationResult(success: false, errorMessage: "Please enter a valid Name")
        }
        
        if request.age.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return ValidationResult(success: false, errorMessage: "Please enter a valid age")
        }
        
        if request.salary.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return ValidationResult(success: false, errorMessage: "Please enter a valid salary")
        }
        return ValidationResult(success: true, errorMessage: nil)
    }
}
