//
//  CreateUserResource.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

struct CreateUserResource {
    
    func createNewUser(userRequest: CreateUserRequest, completionHandler: @escaping (_ result: CreateUserResponse?, _ error: String?) -> Void) {
        
        guard let requestUrl = URL(string: Endpoint.createUser.path()) else {
            completionHandler(nil, "Error:- Incorrect request url path! Unable to convert request path to URL")
            return
        }
        
        let jsonEncoder = JSONEncoder.init()
        do {
            let requestBodyData = try jsonEncoder.encode(userRequest)
            HTTPUtility.postApiData(requestUrl: requestUrl, requestBody: requestBodyData, resultType: CreateUserResponse.self) { result, error in
                if let error = error {
                    completionHandler(nil, error)
                } else {
                    completionHandler(result, nil)
                }
            }
        } catch {
            completionHandler(nil, "Error:- Incorrect User Request unable to convert to data")
        }
    }
    
}
