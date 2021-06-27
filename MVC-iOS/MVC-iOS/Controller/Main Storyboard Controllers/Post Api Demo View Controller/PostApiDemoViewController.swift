//
//  PostApiDemoViewController.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import UIKit

class PostApiDemoViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var salaryTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func resetInputFields() {
        nameTF.text = ""
        salaryTF.text = ""
        ageTF.text = ""
    }
    
    @IBAction func createUserBtn(_ sender: UIButton) {
        createNewEmployee()
    }
}

// MARK: API- create new employee

extension PostApiDemoViewController {
    
    func createNewEmployee() {
        // create validation request
        let userRequest = CreateUserRequest.init(name: self.nameTF.text ?? "", salary: self.salaryTF.text ?? "", age: self.ageTF.text ?? "")
        
        // check validation
        let validator = CreateUserValidation()
        let validationResult = validator.validate(request: userRequest)
        
        if validationResult.success {
            
            // call API
            let userResource = CreateUserResource()
            userResource.createNewUser(userRequest: userRequest) { response, error in
                if let errorVal = error {
                    // error API
                    debugPrint("Error:- " + errorVal)
                    self.showAlert(with: errorVal)
                } else {
                    // success
                    if let responseVal = response {
                        if responseVal.status == "success" {
                            debugPrint("success")
                            self.showAlert(with: responseVal.status)
                            self.resetInputFields()
                        }
                    }
                }
            }
        } else {
            // error validation
            debugPrint("Error:- " + (validationResult.errorMessage ?? ""))
            self.showAlert(with: (validationResult.errorMessage ?? ""))
        }
    }
}

